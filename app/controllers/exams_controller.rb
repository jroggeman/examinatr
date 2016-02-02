class ExamsController < ApplicationController
  def index
    @exams = current_user.exams
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def new
    @exam = Exam.new(user: current_user)
  end

  def create
    @exam = Exam.new(exam_params.merge(user: current_user))
    if @exam.save
      flash[:success] = "Succesfully created #{@exam.name}!"
      redirect_to user_exams_path(current_user)
    else
      flash.now[:error] = "Couldn't create exam :("
      render 'new'
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:name)
  end

end
