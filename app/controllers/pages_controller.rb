class PagesController < ApplicationController

  def home
    @response = Project.index(session, {})
    @projects = @response.parsed_body
    @projects = @projects.take(3)

  end

end
