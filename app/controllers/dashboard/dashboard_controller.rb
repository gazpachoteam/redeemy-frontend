class Dashboard::DashboardController < DashboardController

  def index
    @response = Provider.index(session, {}, params[:provider_id])
    @dashboard_provider = @response.parsed_body
  end
end
