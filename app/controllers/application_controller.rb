class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain(:organization, :subdomain)
  before_action :check_if_organization_on_subdomain
  before_action :check_if_user_on_subdomain
  before_action :authenticate_user!

  protected

  def devise_parameter_sanitizer
    if resource_class == Organization
      DeviseServices::Sanitizers::Organization.new(Organization, :organization, params)
    elsif resource_class == User
      DeviseServices::Sanitizers::User.new(User, :user, params)
    else
      super
    end
  end

  def check_if_organization_on_subdomain
    return unless request.subdomain.empty? && organization_signed_in?

    redirect_to "http://#{current_organization.subdomain}.lvh.me:3000?redirect=true",
                allow_other_host: true
  end

  def check_if_user_on_subdomain
    return unless request.subdomain.empty? && user_signed_in?

    redirect_to "http://#{current_user.organization.subdomain}.lvh.me:3000?redirect=true",
                allow_other_host: true
  end

  def authenticate_inviter!
    authenticate_organization!(force: true)
  end
end
