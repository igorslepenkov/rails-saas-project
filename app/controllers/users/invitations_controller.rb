class Users::InvitationsController < Devise::InvitationsController
  prepend_before_action :find_tenant_by_subdomain
  before_action :set_mailer_host
  skip_before_action :authenticate_user!

  private

  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  def find_tenant_by_subdomain
    if (subdomain = request.subdomain)
      ActsAsTenant.current_tenant = Organization.where(subdomain: subdomain.downcase).first
    end
  end
end
