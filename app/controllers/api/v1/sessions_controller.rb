class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authenticate, only: :create

  def create
    user = User.find_by(username: create_params[:username])
    if user && user.authenticate(create_params[:password])
      render(
        json: user,
        status: 201
      )
    else
      return api_error(status: 401)
    end
  end

  private

  def create_params
    params.require(:user).permit(:username, :password)
  end
end
