module Authentication extend ActiveSupport::Concern

  included do
    before_action :require_authentication
    helper_method :current_user
    helper_method :log_in
  end

  module ClassMethods
    def skip_authentication(options = {})
      skip_before_action :require_authentication, options.slice(:only, :except)
    end
  end

  private

  # Gets currently logged in user if available
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id) if session[:user_id]
    @current_user = nil
  end

  # When included, redirect the user if they aren't logged in
  def require_authentication
    respond_to do |format|
      format.any(:html, :pdf) { redirect_to login_url unless current_user }
      format.json { head :unauthorized unless current_user }
    end
  end

end
