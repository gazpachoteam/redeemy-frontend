class Customer < Base

  def self.routes
    {
      index: ['/customers', :get]
    }
  end
  
end
