class Project < Base
  def self.routes
    {
      organization_index: ['/organizations/%d/projects', :get],
      index: ['/projects', :get],
      show: ['/projects/%d', :get],
      update: ['/projects/%d', :put],
      create: ['/projects', :post],
      featured: ['/projects/featured', :get],
    }
  end
end
