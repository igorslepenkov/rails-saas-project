class ValidationsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_organization!
  skip_before_action :verify_authenticity_token

  def organization_valid?
    validation = nil
    ActsAsTenant.without_tenant do
      organization = Organization.new(organization_params)
      validation = organization.valid?
    end
    render json: validation
  end

  private

  def organization_params
    params.require(:validation).permit(:email, :name, :password, :plan, :subdomain)
  end
end