class Dashboard::ProjectsController < DashboardController


  def index
    if has_role? "OrgAdmin"
      @response = OrgAdmin.show(session, {}, session[:user_id])
      @org_admin = @response.parsed_body

      @response = Project.organization_index(session, {}, @org_admin["organization_id"])
      @projects = @response.parsed_body
    elsif has_role? "Admin"
      @response = Project.index(session, {})
      @projects = @response.parsed_body
    end
  end

end
