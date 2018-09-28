class ProviderAdmin::DashboardController < ProviderAdminController

  def index
    @response = Provider.show(session, {}, params[:provider_id])
    @provider = @response.parsed_body
    
    @utterances = [
      "Consulta y haz seguimiento a tus ordenes",
      "Actualiza tu catálogo",
      "Genera reportes"
    ]

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@provider.name}-reporte-#{Time.now.to_datetime}",
               layout: 'application',
               disposition: 'attachment'
      end
    end
  end
end
