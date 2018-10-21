class Customer < Base

  def self.routes
    {
      index: ['/customers', :get],
      show: ['/customers/%d', :get],
      redemtions: ['/customers/%d/redemptions', :get]
    }
  end

end
