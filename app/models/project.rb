class Project < Base
  def self.routes
    {
      request_token: ['/request_token', :post]
    }
  end
end
