class Organizations::ProjectsController < ApplicationController

  def index
    @response = Organization.show(session, {}, params[:organization_id])
    @organization = @response.parsed_body
    @response = Project.organization_index(session, {}, params[:organization_id])
    @projects = @response.parsed_body
  end

end
