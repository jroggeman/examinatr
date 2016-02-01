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

  # When included, redirect the user if they aren't logged in
  def require_authentication
    unless current_user
      respond_to do |format|
        format.html { redirect_to login_url }
        format.any  { head :unauthorized }
      end
    end
  end

end
