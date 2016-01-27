class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Welcome to Examinatr :)"
      redirect_to user
    else
      flash[:error] = "Problem saving user"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :name)
    end
end
