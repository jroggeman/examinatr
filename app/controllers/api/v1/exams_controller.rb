class Api::V1::ExamsController < Api::V1::BaseController
  # TODO: All should be json
  # respond_to :json

  before_action :set_exam, only: [:show]

  def index
    @exams = @user.exams
    render json: @exams
  end

  def show
    render json: @exam
  end

  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      redirect_to exam_path(@exam)
    else
      render 'new'
    end
  end

  def update
    @exam = Exam.find_by(params[:id])
    redirect_to exams_path if @exam.nil?

    if @exam.update_attributes(exam_params)
      redirect_to exam_path(@exam)
    else
      render 'new'
    end
  end

  private

  def set_exam
    @exam = current_user.exams.find_by_id(params[:id])
    redirect_to exams_path if @exam.nil?
  end

  def json
    JSON.parse(response.body)
  end

  def exam_params
    params.require(:data).require(:attributes).permit(:name)
    # ActiveModelSerializers::Deserialization.jsonapi_parse(json)
  end
end
