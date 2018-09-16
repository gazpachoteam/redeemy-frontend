class ProviderAdmin::RedemptionsController < ProviderAdminController
  before_action :set_provider

  def index
    @redemptions = @provider.redemptions
  end

  private

  def set_provider
    @provider = Provider.find(params[:provider_id])
  end
end
