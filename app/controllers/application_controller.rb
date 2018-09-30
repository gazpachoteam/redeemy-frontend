require 'exceptions'

class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from UnauthorizedException, :with => :user_not_authorized

  #NOTE! This method recalculates the current roles!
  def logged_in?
    return current_role! != nil
  end

  def current_role!
    if session[:auth_token]
      @response = User.type(session, {}, session[:user_id])
      session[:current_role] = @response.parsed_body['type']
    else
      session.delete(:current_role)
    end
  rescue UnauthorizedException
    #If this point is reached, then the token stored in the
    #session is fake or no longer registered, hence it will be destroyed
    session.delete(:auth_token)
    session.delete(:current_role)
  ensure
    return session[:current_role]
  end

  #NOTE This method does not recalculate the current roles
  def has_role?(role_name)
    unless session[:auth_token] && session[:current_role]
      return false
    end
    return session[:current_role] == role_name.to_s
  end

  private

  def user_not_authorized
    if session[:auth_token]
      render :unauthorized
    else
      redirect_to :sign_in_user
    end
  end
end
