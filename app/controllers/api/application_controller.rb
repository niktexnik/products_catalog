module Api
  class ApplicationController < ActionController::Base
    include ExceptionsHandler

    skip_before_action :verify_authenticity_token
    before_action :current_user

    def current_user
      @current_user ||= User.find_by(auth_token: cookies.encrypted[:auth_token])
      raise UnauthorizedError, 'User not authorized, please login again' if @current_user.nil?
    end
  end
end
