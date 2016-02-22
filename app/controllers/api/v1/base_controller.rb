class Api::V1::BaseController < ApplicationController
  # TODO: Handle authenticity token better
  skip_before_action :verify_authenticity_token

  # TODO: Make authentication more modular
  skip_authentication

  before_action :authenticate

  def api_error(status: 500, errors: [])
    unless Rails.env.production?
      puts errors.full_messages if errors.respond_to? :full_messages
    end

    head status: status and return if errors.empty?

    render json: errors.to_json, status: status
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @user = User.where(api_key: token).first
    end
  end

  def api_user
    @user
  end
end
