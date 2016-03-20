class Api::V1::ExamsController < Api::V1::BaseController
  before_action :set_exam, only: [:show, :update, :destroy]

  def index
    @exams = current_user.exams
    render json: @exams
  end

  def show
    render json: @exam
  end

  def create
    @exam = Exam.new(exam_params)
    @exam.user = api_user

    if @exam.save
      render json: @exam
    else
      api_error(status: 422, errors: @exam.errors)
    end
  end

  def update
    @exam = Exam.find_by(params[:id])
    api_error(status: 404, errors: @exam.errors) if @exam.nil?

    if @exam.update_attributes(exam_params)
      render json: @exam
    else
      api_error(status: 422, errors: @exam.errors)
    end
  end

  def destroy
    Exam.destroy(params[:id]) unless @exam.nil?
    redirect_to exams_path
  end

  private

  def set_exam
    @exam = api_user.exams.find_by_id(params[:id])
    api_error(status: 404) if @exam.nil?
  end

  def exam_params
    params.require(:data).require(:attributes).permit(:name)
  end
end
