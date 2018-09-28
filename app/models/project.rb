class Project < Base
  def self.routes
    {
      index: ['/providers/%d/projects', :get]
    }
  end
end
