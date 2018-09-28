class ProviderAdmin::RedemptionsController < ProviderAdminController

  def index
    @response = Provider.show(session, {}, params[:provider_id])
    @provider = @response.parsed_body
    
    @response = Redemption.index(session, {}, params[:provider_id])
    @redemptions = @response.parsed_body

  end

end
