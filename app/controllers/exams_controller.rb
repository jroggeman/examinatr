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
  end

end
