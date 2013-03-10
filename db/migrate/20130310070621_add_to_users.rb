class AddToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :profile_name, :string
  end

  def down
  	drop_column :users, :first_name, :string
  	drop_column :users, :last_name, :string
  	drop_column :users, :profile_name, :string
  end
end
