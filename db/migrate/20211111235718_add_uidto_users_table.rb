class AddUidtoUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :integer, default: 0
  end
end
