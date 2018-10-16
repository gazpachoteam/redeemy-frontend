class ProjectsController < ApplicationController

  def index
    @response = Project.index(session, {})
    @projects = @response.parsed_body

    @response = Category.index(session, {})
    @categories = @response.parsed_body
  end

  def show
    @response = Project.show(session, {}, params[:id])
    @project = @response.parsed_body
  end

  def finance
    @response = Project.show(session, {}, params[:id])
    @project = @response.parsed_body
  end
end
