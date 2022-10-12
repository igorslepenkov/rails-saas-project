class ProjectsController < ApplicationController
  skip_before_action :authenticate_organization!, only: %i[index show]
  skip_before_action :authenticate_user!, except: %i[index]
  before_action :initialize_project, except: %i[index new create manage_team assign_user withdraw_user]

  def index
    @projects = current_user.projects
  end

  def show; end

  def new; end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to pages_dashboard_path, notice: 'Project has been successfully created'
    else
      render 'new', status: :bad_request
    end
  end

  def edit; end

  def update
    @project.update(project_params)
    if @project.save
      redirect_to pages_dashboard_path, notice: 'Project has been updated'
    else
      render 'edit', status: :bad_request
    end
  end

  def destroy
    @project.destroy
    redirect_to pages_dashboard_path, notice: 'Project has been successfully destroyed'
  end

  def manage_team
    @project = Project.find(params.require(:project_id))
    @users_to_assign = current_organization.users.filter { |user| !@project.users.include?(user) }
  end

  def assign_user
    @project = Project.find(params.require(:project_id))
    @user = User.find(params.require(:project_user))
    @project.users << @user
    redirect_to project_path(@project), notice: 'User assigned successfully'
  end

  # def withdraw_user
  #   withdraw_user_id = params
  #   filtered_users = @project.users.filter { |user| user.id != id }
  #   @project.users = filtered_users
  #   redirect_to project_path(@project), notice: 'User withdrawed successfully'
  # end

  private

  def project_params
    params.require(:project).permit(:title, :details, :expected_completion_date)
  end

  def initialize_project
    @project = Project.find(params[:id])
  end
end
