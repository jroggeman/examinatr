class Api::V1::QuestionsController < Api::V1::BaseController
  def show
    @question = Question.find_by(id: params[:id])
    api_error(404) if @question.exam.user != current_user
    render json: @question
  end

  def create
    @question = Question.new(question_params)

    exam = Exam.find_by(id: question_exam[:id])
    api_error(status: 404) if exam.nil?

    @question.exam = exam

    if @question.save
      render json: @question
    else
      api_error(status: 422, errors: @question.errors)
    end
  end

  def update
    @question = Question.find_by(id: params[:id])

    api_error(status: 404) if @question.nil?

    if @question.update_attributes(question_params)
      render json: @question
    else
      api_error(status: 422, errors: @question.errors)
    end
  end

  def destroy
    @question = Question.find_by(id: params[:id])

    api_error(status: 404) if @question.nil?

    if @question.destroy
      render nothing: true, status: :no_content
    else
      api_error(status: 500)
    end
  end

  private

  def question_params
    params.require(:data).require(:attributes).permit(:number, :text, :answer, :points, :exam_id)
  end

  def question_exam
    params.require(:data).require(:relationships).require(:exam).require(:data).permit(:id)
  end

  def set_exam
    @exam = Exam.find_by(id: params[:exam_id])
    api_error(status: 404) if @exam.nil?
  end
end
