class Users::InvitationsController < Devise::InvitationsController
  include DeviseTenants
  before_action :set_mailer_host
  skip_before_action :authenticate_user!

  private

  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end
