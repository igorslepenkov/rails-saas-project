class AddFileToArtifacts < ActiveRecord::Migration[7.0]
  def change
    add_column :artifacts, :file, :string
  end
end
