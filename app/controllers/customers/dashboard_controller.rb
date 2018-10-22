class Customers::DashboardController < ApplicationController

  def index
    @response = Project.index(session, {})
    @projects = @response.parsed_body

    @response = Category.index(session, {})
    @categories = @response.parsed_body

    @response = Customer.show(session, {}, session[:user_id])
    @customer = @response.parsed_body
    
    #@response = Customer.redemptions(session, {}, session[:user_id])
    #@redemptions = @response.parsed_body
  end

end
