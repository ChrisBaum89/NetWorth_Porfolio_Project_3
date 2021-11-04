class Addforeignkeystoaccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :user_id, :integer
    add_column :accounts, :category_id, :integer
  end
end
