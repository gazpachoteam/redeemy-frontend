class Project < Base
  def self.routes
    {
      organization_index: ['/organizations/%d/projects', :get],
      index: ['/projects', :get],
      show: ['/projects/%d', :get]
    }
  end
end
