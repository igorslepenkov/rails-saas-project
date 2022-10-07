class ArtifactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @artifact = Artifact.new
    @artifact.project_id = params[:project_id]
  end

  def create
    @artifact = Artifact.new(artifact_params)
    storage = ArtifactUploader.new
    obj = storage.store!(@artifact.file)
    @artifact.key = storage.url

    if @artifact.save
      redirect_to project_path(@artifact.project), notice: 'Artifact has been added'
    else
      render 'new', status: :bad_request
    end
  end

  private

  def artifact_params
    params.require(:artifact).permit(:name, :file)
  end
end
