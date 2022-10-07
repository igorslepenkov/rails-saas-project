class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :initialize_project, only: %i[show edit update destroy]

  def show; end

  def new; end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to pages_dashboard_path, notice: "Project has been successfully created"
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

  private

  def project_params
    params.require(:project).permit(:title, :details, :expected_completion_date)
  end

  def initialize_project
    @project = Project.find(params[:id])
  end
end
