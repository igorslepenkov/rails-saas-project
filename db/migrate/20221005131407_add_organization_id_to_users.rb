class AddOrganizationIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :users, :organization, index: false
  end
end
