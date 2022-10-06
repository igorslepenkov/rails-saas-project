class PagesController < ApplicationController
  before_action :authenticate_organization!, only: [:dashboard]
  skip_before_action :authenticate_user!
  def home; end

  def about; end

  def plans; end

  def dashboard
    @organization = current_organization
    @domain = request.host_with_port
  end
end
