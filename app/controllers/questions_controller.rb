class QuestionsController < ApplicationController
  before_action :set_exam

  def new
    @question = Question.new
    @question.number = @exam.questions.count + 1
  end

  def create
    @question = Question.new(question_params)
    @question.number = @exam.questions.count + 1

    @question.exam = @exam

    if @question.save
      redirect_to new_exam_question_path(@exam)
    else
      flash.now[:error] = "Couldn't create question :/"
      render 'new'
    end
  end

  def show
    q = Question.find_by(id: params[:id])
    redirect_to exam_path(@exam) if q.nil?
  end

  def edit
    @question = Question.find_by(id: params[:id])
    redirect_to exam_path(@exam) if @question.nil?
  end

  def update
    @question = Question.find_by(id: params[:id])
    redirect_to exam_path(@exam) if @question.nil?

    if @question.update(question_params)

      if @question.is_last_question_of_exam?
        redirect_to new_exam_question_path(@exam)
      else
        previous_number = @question.number + 1
        next_question = @exam.questions.find_by(number: previous_number)
        redirect_to edit_exam_question_path(@exam, next_question)
      end
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
end
