module DeviseTenants
  extend ActiveSupport::Concern

  included do
    prepend_before_action :find_tenant_by_subdomain
  end

  private

  def find_tenant_by_subdomain
    if (subdomain = request.subdomain)
      ActsAsTenant.current_tenant = Organization.where(subdomain: subdomain.downcase).first
    end
  end
end