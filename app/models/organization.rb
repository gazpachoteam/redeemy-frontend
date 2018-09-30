class Organization < Base
  def self.routes
    {
      show: ['/organizations/%d', :get],
      index: ['/organizations', :get],
      org_admin_index: ['/org_admins/%d/organization', :get]
    }
  end
end
