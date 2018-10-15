class OrgAdmins::DashboardController < ApplicationController

  def index
    @response = Organization.org_admin_index(session, {}, session[:user_id])
    @organization = @response.parsed_body
  end
end
