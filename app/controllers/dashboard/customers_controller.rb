class Dashboard::CustomersController < DashboardController


  def index
    @response = Customer.index(session, {})
    @customers = @response.parsed_body
  end


end
