class ProviderAdmin::ProjectsController < ProviderAdminController

  def index
    @response = Provider.show(session, {}, params[:provider_id])
    @provider = @response.parsed_body

    @response = Project.provider_index(session, {}, params[:provider_id])
    @projects = @response.parsed_body
  end

end
