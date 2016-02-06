class UsersController < ApplicationController
  skip_authentication only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Examinatr :)"

      log_in(@user)
      redirect_to exams_path
    else
      flash.now[:error] = "Problem saving user"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :name)
    end
end
