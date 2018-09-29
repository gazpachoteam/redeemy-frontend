class Dashboard::DashboardController < DashboardController

  def index
    @response = Provider.index(session, {}, params[:provider_id])
    @providers = @response.parsed_body
  end
end
