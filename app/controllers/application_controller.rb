require 'exceptions'

class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from UnauthorizedException, :with => :user_not_authorized

  private

  def user_not_authorized
    if session[:auth_token]
      render :unauthorized
    else
      redirect_to :sign_in_user
    end
  end
end
