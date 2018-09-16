class Dashboard::ProvidersController < DashboardController
  def index
    @providers = Provider.all
  end
end
