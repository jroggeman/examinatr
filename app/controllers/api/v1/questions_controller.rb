class Api::V1::QuestionsController < Api::V1::BaseController
  def show
    @question = Question.find_by(id: params[:id])
    api_error(404) if @question.exam.user != current_user
    render json: @question
  end

  private

  def set_exam
    @exam = Exam.find_by(id: params[:exam_id])
    api_error(status: 404) if @exam.nil?
  end
end
