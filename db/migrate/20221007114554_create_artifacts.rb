class CreateArtifacts < ActiveRecord::Migration[7.0]
  def change
    create_table :artifacts do |t|
      t.string :name
      t.string :key
      t.belongs_to :project
    end
  end
end
