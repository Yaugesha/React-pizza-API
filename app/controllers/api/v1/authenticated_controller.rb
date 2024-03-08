class Api::V1::AuthenticatedController < ApplicationController::Base
  before_action :authenticate

  attr_reader :current_token, :current_user

  def authenticate
    authenticate_user_with_token || handel_bad_authentication
  end

  private

  def authenticate_user_with_token
    authenticate_with_http_token do |token, options|
      @current_token = Token.where(active: true).find_by(token: token)
      @current_user = @current_token&.user
    end

  end

  def handel_bad_authentication
    render json: {message: "Bad credentials"}, status: :unauthorized
  end

end
