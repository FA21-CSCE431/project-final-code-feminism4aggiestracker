class AddMemberToBio < ActiveRecord::Migration[6.1]
  def change
    add_column :bios, :member_id, :bigint
    add_index :bios, :member_id
  end
end
