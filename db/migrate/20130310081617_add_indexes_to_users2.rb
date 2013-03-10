class AddIndexesToUsers2 < ActiveRecord::Migration
  def change
  	remove_index :users, :column => "profile_name"
  	add_index :users, :profile_name, :unique => true
  end
end
