class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :dollar_value
      t.integer :number_of_users
    end
  end
end
