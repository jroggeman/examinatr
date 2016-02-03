class SessionsController < ApplicationController
  skip_authentication only: [:new, :create]

  def new
    if current_user
      redirect_to exams_path
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to exams_path
    else
      # Use flash for this rendering, not the next page load
      flash.now[:danger] = "Invalid username/password combination"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
