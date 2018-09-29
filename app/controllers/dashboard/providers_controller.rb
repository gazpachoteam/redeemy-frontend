class Dashboard::ProvidersController < DashboardController
  def index
    @response = Provider.index(session, {}, params[:provider_id])
    @providers = @response.parsed_body
    
  end
end
