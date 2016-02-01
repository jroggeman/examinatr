class ExamsController < ApplicationController
  def index
    @exams = current_user.exams
  end

  def new
    @exam = Exam.new(user: current_user)
  end

  def create
  end

  def show
  end
end
