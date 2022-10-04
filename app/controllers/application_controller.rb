class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def devise_parameter_sanitizer
    if resource_class == Organization
      DeviseServices::Sanitizers::Organization.new(Organization, :organization, params)
    else
      super
    end
  end
end
