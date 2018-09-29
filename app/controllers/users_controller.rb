class UsersController < ApplicationController

  def login_form
    session[:login_attr] = {} unless session[:login_attr]
    #Validate the token in the session, if any.
    #logged_in?
  end

  def login
    @response = User.login(session, {:body => params.slice(:email,:password)})
    if @response.code == 200
      session[:auth_token] = @response.parsed_body['token']
      session[:user_email] = params[:email]
      #get the current roles and store them in the sessionx
      current_role!
      # render(:index)
      redirect_to '/home'
    else
      if @response.parsed_body['notice']
        flash[:warning]=@response.parsed_body['notice']
      end
      session[:login_attr] = params.slice(:email)
      render(:login_form, :status => @response.code) and return
    end
  rescue UnauthorizedException
    session[:login_attr] = params.slice(:email)
    raise
  end
end
