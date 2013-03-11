class AddProfileColumnsToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :bio, :text
  	add_column :users, :linkedin_url, :string
  	add_column :users, :facebook_url, :string
  	add_column :users, :twitter_url, :string
  	add_column :users, :expertise, :text
  end

  def down
  	drop_column :users, :bio, :text
  	drop_column :users, :linkedin_url, :string
  	drop_column :users, :facebook_url, :string
  	drop_column :users, :twitter_url, :string
  	drop_column :users, :expertise, :text
  end
end
