class ArtifactsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_artifact, only: %i[show destroy]

  def new
    @artifact = Artifact.new
    @artifact.project_id = params[:project_id]
  end

  def create
    @artifact = Artifact.new(artifact_params)
    if @artifact.save
      redirect_to project_path(@artifact.project), notice: 'Artifact has been added'
    else
      puts @artifact.errors.full_messages
      render 'new', status: :bad_request
    end
  end

  def destroy
    project = @artifact.project
    @artifact.destroy
    redirect_to project_path(project), notice: 'Artifact destroyed'
  end

  private

  def artifact_params
    params.require(:artifact).permit(:name, :key, :file, :project_id)
  end

  def set_artifact
    @artifact = Artifact.find(params[:id])
  end
end
