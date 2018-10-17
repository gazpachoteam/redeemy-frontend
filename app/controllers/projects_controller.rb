class ProjectsController < ApplicationController

  def index
    if params[:category_id].present?
      @response = Category.show(session, {}, params[:category_id])
      @category = @response.parsed_body
      @response = Project.index(session, {params: {category_id: params[:category_id]}})
    else
      @response = Project.index(session, {})
    end
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
