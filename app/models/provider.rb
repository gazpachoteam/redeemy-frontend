class Provider < Base
  def self.routes
    {
      show: ['/providers/%d', :get]
    }
  end
end
