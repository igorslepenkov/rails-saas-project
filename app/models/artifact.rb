class Artifact < ApplicationRecord
  acts_as_tenant :organization
  belongs_to :project
  mount_uploader :file, ArtifactUploader
end