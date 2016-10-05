class AddResourceOwnerIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :resource_owner_id, :string
  end
end
