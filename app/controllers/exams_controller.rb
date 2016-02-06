class ExamsController < ApplicationController
  def index
    @exams = current_user.exams
  end

  def show
    @exam = current_user.exams.find_by_id(params[:id])
    redirect_to exams_path if @exam.nil?
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

  def destroy
    @exam = current_user.exams.find_by_id(params[:id])
    Exam.destroy(params[:id]) unless @exam.nil?
    redirect_to exams_path
  end

  private

  def exam_params
    params.require(:exam).permit(:name)
  end

end
