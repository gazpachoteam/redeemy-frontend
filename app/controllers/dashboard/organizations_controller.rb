class Dashboard::OrganizationsController < DashboardController
  def index
    @response = Organization.index(session, {}, params[:provider_id])
    @organizations = @response.parsed_body

  end
end
