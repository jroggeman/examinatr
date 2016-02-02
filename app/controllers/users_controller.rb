class UsersController < ApplicationController
  skip_authentication only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # Use @user in case we redirect to new (need reference for form)
    @user = User.new(user_params)
    if @user.save
      # Log the user in after registration
      log_in(@user)
      flash[:success] = "Welcome to Examinatr :)"
      redirect_to user_exams_path(@user)
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
