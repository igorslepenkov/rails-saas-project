class PagesController < ApplicationController
  skip_before_action :authenticate_organization!, except: [:dashboard]
  skip_before_action :authenticate_user!
  
  def home; end

  def about; end

  def plans; end

  def dashboard
    @organization = current_organization
    @domain = request.host_with_port
    @projects = Project.all
  end

  def edit_plan
    @organization = current_organization
  end

  def upgrade_plan
    @organization = current_organization
    @organization.update(upgrade_plan_params)
    @organization.update(plan: 'premium')
    redirect_to pages_dashboard_path, notice: 'Plan changed successfully'
  end

  private

  def upgrade_plan_params
    params.require(:organization).permit(:payment)
  end
end
