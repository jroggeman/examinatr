class StaticPagesController < ApplicationController
  skip_authentication

  def home
    redirect_to exams_path if current_user
  end
end
