class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :render_for_print, :destroy]

  def index
    @exams = current_user.exams
    respond_to do |format|
      format.html
      format.json { render json: @exams}
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @exam }
    end
  end

  def render_for_print
    respond_to do |format|
      format.html
      format.pdf { render pdf: 'exam.pdf' }
    end
  end

  def new
    @exam = Exam.new(user: current_user)
  end

  def create
    @exam = Exam.new(exam_params.merge(user: current_user))

    if @exam.save
      flash[:success] = "Succesfully created #{@exam.name}!"
      redirect_to exam_path(@exam)
    else
      flash.now[:error] = "Couldn't create exam :("
      render 'new'
    end
  end

  def edit
  end

  def update
    @exam = Exam.find_by(id: params[:id])

    if @exam.update(exam_params)
      flash[:success] = "Succesfully updated #{@exam.name}!"
      redirect_to exam_path(@exam)
    else
      flash.now[:error] = "Couldn't update exam :("
      render 'new'
    end
  end

  def destroy
    Exam.destroy(params[:id]) unless @exam.nil?
    redirect_to exams_path
  end

  private

  def exam_params
    params.require(:exam).permit(:name)
  end

  def set_exam
    @exam = current_user.exams.find_by_id(params[:id])
    redirect_to exams_path if @exam.nil?
  end
end
