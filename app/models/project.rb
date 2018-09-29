class Project < Base
  def self.routes
    {
      provider_index: ['/providers/%d/projects', :get],
      index: ['/projects', :get],
      show: ['/projects/%d', :get]
    }
  end
end
