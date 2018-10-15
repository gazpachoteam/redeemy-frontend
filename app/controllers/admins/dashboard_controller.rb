class Admins::DashboardController < ApplicationController

  def index
    @response = Organization.index(session, {})
    @organizations = @response.parsed_body
  end
end
