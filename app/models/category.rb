class Category < Base
  def self.routes
    {
      index: ['/categories', :get],
    }
  end
end
