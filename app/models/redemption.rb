class Redemption < Base

  def self.routes
    {
      index: ['/providers/%d/redemptions', :get]
    }
  end

end
