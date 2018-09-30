class Provider < Base
  def self.routes
    {
      show: ['/providers/%d', :get],
      index: ['/providers', :get]
    }
  end
end
