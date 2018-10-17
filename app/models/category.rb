class Category < Base
  def self.routes
    {
      index: ['/categories', :get],
      show: ['/categories/%d', :get],
    }
  end
end
