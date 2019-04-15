class AddResourceOwnerIdToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :resource_owner_id, :string
  end
end
