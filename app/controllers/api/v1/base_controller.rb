class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  # TODO: Make authentication more modular
  skip_authentication

  before_action :destroy_session
  before_action :authenticate

  private

  def api_error(status: 500, errors: [])
    unless Rails.env.production?
      puts errors.full_messages if errors.respond_to? :full_messages
    end

    head status: status and return if errors.empty?

    render json: errors.to_json, status: status
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @user = User.where(api_key: token).first
    end
  end

  def destroy_session
    request.session_options[:skip] = true
  end

  def api_user
    @user
  end

  def not_found
    return api_error(status: 404, errors: 'Resource not found')
  end
end
