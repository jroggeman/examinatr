class Api::V1::ExamsController < Api::V1::BaseController
  # TODO: All should be json
  # respond_to :json

  before_action :set_exam, only: [:show, :update, :destroy]

  def index
    @exams = @user.exams
    render json: @exams
  end

  def show
    render json: @exam
  end

  def create
    @exam = Exam.new(exam_params)
    @exam.user = api_user

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

  def destroy
    Exam.destroy(params[:id]) unless @exam.nil?
    redirect_to exams_path
  end

  private

  def set_exam
    @exam = api_user.exams.find_by_id(params[:id])
    redirect_to exams_path if @exam.nil?
  end

  def exam_params
    params.require(:data).require(:attributes).permit(:name)
  end
end
