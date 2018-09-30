class Dashboard::DashboardController < DashboardController

  def index
    if has_role? "OrgAdmin"
      @response = Organization.org_admin_index(session, {}, session[:user_id])
      @organization = @response.parsed_body
    elsif has_role? "Admin"
      @response = Organization.index(session, {})
      @organizations = @response.parsed_body
    end
  end
end
