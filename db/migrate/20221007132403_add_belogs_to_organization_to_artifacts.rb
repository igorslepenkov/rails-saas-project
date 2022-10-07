class AddBelogsToOrganizationToArtifacts < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :artifacts, :organization
  end
end
