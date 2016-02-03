class QuestionsController < ApplicationController
  before_action :set_exam

  def new
    @q = Question.new
    @q.number = @exam.questions.count + 1
  end

  def create
    @q = Question.new(question_params)
    if q.save
      redirect_to new_exam_question(@exam)
    else
      flash.now[:error] = "Couldn't create question :/"
      render 'new'
    end
  end

  def show
    q = Question.find_by(params[:id])
    redirect_to exam_path(@exam) if q.nil?
  end

  private

    def question_params
      params.require(:question).permit(:text, :points, :exam)
    end

    def set_exam
      @exam = Exam.find_by(params[:exam_id])
      redirect_to exams_path if @exam.nil?
    end
end
