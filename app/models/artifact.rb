class Artifact < ApplicationRecord
  acts_as_tenant :organization
  belongs_to :project
  mount_uploader :key, ArtifactUploader
  validate :key_size

  private

  def key_size
    errors.add(:key, 'should be less than 5MB') if key.size > 5.megabytes
  end
end
