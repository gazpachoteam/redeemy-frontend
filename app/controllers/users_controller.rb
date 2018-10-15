class UsersController < ApplicationController
  before_action :set_authenticate_params

  def login_form
    session[:login_attr] = {} unless session[:login_attr]
    # Validate the token in the session, if any.
    logged_in?
  end

  def request_token
    @response = User.request_token(session, {body: authenticate_params })
    render :login_form
  end

  def login
    @response = User.authenticate_token(session, {body: authenticate_params })
    if @response.code == 200
      session[:auth_token] = @response.parsed_body['authentication_token']
      session[:user_id] = @response.parsed_body['user_id']
      #get the current roles and store them in the sessionx
      current_role!
      case session[:current_role]
      when "Customer"
        redirect_to projects_path
      when "OrgAdmin"
        redirect_to org_admin_dashboard_index_path(session[:user_id])
      when "Admin"
        redirect_to admin_dashboard_index_path(session[:user_id])
      else
        redirect_to root_path
      end
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

  def logout
    @response = User.logout(session, {})
    redirect_to root_path
  ensure
    #Delete cached objects from this session
    token = session[:auth_token]

    session.delete(:auth_token)
    session.delete(:current_role)
  end

  private

  def authenticate_params
    params.permit(:login_handler, :code)
  end

  def set_authenticate_params
    @login_handler = params[:login_handler] if params[:login_handler].present?
    @code = params[:code] if params[:code].present?
  end
end
