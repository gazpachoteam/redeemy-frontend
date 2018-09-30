class User < Base
  def self.routes
    {
      request_token: ['/request_token', :post],
      authenticate_token: ['/authenticate_token', :post],
      type: ['/users/%d/type', :get],
      logout: ['/tokens', :delete]
    }
  end
end
