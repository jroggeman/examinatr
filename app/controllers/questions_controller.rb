class QuestionsController < ApplicationController
  before_action :set_exam
  before_action :set_question

  def new
    @question = Question.new
    set_question_number(@question)
  end

  def create
    @question = Question.new(question_params)

    set_question_number(@question)
    @question.exam = @exam

    if @question.save
      flash[:success] = 'Question added!'
      redirect_to edit_exam_question_path(@exam, @question)
    else
      flash.now[:error] = 'Couldn\'t create question :/'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:success] = 'Succesfully updated question!'
      redirect_to edit_exam_question_path(@exam, @question)
    else
      flash.now[:error] = "Couldn't update question :/"
      render 'edit'
    end
  end

  private

    def question_params
      params.require(:question).permit(:text, :points, :exam)
    end

    def set_exam
      @exam = Exam.find_by(id: params[:exam_id])
      redirect_to exams_path if @exam.nil?
    end

    def set_question
      @question = Question.find_by(id: params[:id])
    end

    def set_question_number(question)
      question.number = @exam.questions.count + 1
      redirect_to exam_path(@exam) if @question.nil?
    end
end
