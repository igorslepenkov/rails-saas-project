class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain(:organization, :subdomain)
  before_action :check_if_on_subdomain
  before_action :authenticate_user!

  protected

  def devise_parameter_sanitizer
    if resource_class == Organization
      DeviseServices::Sanitizers::Organization.new(Organization, :organization, params)
    else
      super
    end
  end

  def check_if_on_subdomain
    return unless request.subdomain.empty? && organization_signed_in?

    current_path = URI(request.url).path
    redirect_to "http://#{current_organization.subdomain}.lvh.me:3000/#{current_path}", allow_other_host: true
  end
end
