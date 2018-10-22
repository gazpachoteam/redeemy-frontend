class Organizations::ProjectsController < ApplicationController
  before_action :set_organization
  before_action :set_project, only: [:show, :edit]

  def index
    @response = Project.organization_index(session, {}, params[:organization_id])
    @projects = @response.parsed_body
  end

  def show
  end

  def new
    @project = {}
  end

  def create
    @response = Project.create(session, {body: project_create_params }, params[:id])
    if @response.code == 201
      @project = @response.parsed_body
      redirect_to organization_project_path(@organization["id"], @project["id"])
    else
      render :new
    end
  end

  def edit
  end

  def update
    @response = Project.update(session, {body: project_update_params }, params[:id])
    if @response.code == 200
      @project = @response.parsed_body
      redirect_to organization_project_path(@organization["id"], @project["id"])
    else
      render :edit
    end
  end

  private

  def project_update_params
    params.require(:project).permit(:name, :description)
  end

  def project_create_params
    attrs = params.require(:project).permit(:name, :description)
    attrs[:organization_id] = @organization["id"]
    attrs
  end

  def set_organization
    @response = Organization.show(session, {}, params[:organization_id])
    @organization = @response.parsed_body
  end

  def set_project
    @response = Project.show(session, {}, params[:id])
    @project = @response.parsed_body
  end

end
