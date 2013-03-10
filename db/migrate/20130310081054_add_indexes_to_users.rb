class AddIndexesToUsers < ActiveRecord::Migration
  def change
  	add_index :users, :profile_name
  end
end
