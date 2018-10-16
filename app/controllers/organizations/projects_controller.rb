class Organizations::ProjectsController < ApplicationController
  before_action :set_organization
  before_action :set_project, only: [:show, :edit]

  def index
    @response = Project.organization_index(session, {}, params[:organization_id])
    @projects = @response.parsed_body
  end

  def show
  end

  def edit
  end

  private

  def set_organization
    @response = Organization.show(session, {}, params[:organization_id])
    @organization = @response.parsed_body
  end

  def set_project
    @response = Project.show(session, {}, params[:id])
    @project = @response.parsed_body
  end

end
