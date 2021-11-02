class DeleteAdminIdFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :admin_id
  end
end
