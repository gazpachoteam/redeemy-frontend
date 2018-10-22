class PagesController < ApplicationController

  def home
    set_projects
    set_featured_project
  end

  def about
    
  end

  private

  def set_projects
    @response = Project.index(session, {})
    @projects = @response.parsed_body
    @projects = @projects.take(3)
  end

  def set_featured_project
    @response = Project.featured(session, {})
    @featured_projects = @response.parsed_body
    @featured_project = @featured_projects.sample
  end

end
