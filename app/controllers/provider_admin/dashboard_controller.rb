class ProviderAdmin::DashboardController < ProviderAdminController
  before_action :set_provider

  def index
    @utterances = [
      "Consulta y haz seguimiento a tus ordenes",
      "Actualiza tu catálogo",
      "Genera reportes"
    ]
  end

  private

  def set_provider
    @provider = Provider.find(params[:provider_id])
  end
end
