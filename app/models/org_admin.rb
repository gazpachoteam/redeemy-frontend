class OrgAdmin < Base
  def self.routes
    {
      show: ['/org_admins/%d', :get],
      index: ['/org_admins', :get]
    }
  end
end
