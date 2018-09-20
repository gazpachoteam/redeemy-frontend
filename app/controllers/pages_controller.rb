class PagesController < ApplicationController
  def catalog
    @response = Project.index(session)
    @projects = @response.parsed_body
  end
end
