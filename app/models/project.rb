class Project < Base
  def self.routes
    {
      index: ['/projects', :get]
    }
  end
end
