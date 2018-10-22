class Redemption < Base

  def self.routes
    {
      index: ['/redemptions', :get]
    }
  end

end
