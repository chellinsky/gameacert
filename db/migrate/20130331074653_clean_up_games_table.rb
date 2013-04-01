class CleanUpGamesTable < ActiveRecord::Migration
  def change
  	add_column :games, :shortname, :string
  end

  def up
  	add_index :games, :shortname, :unique => true
  	add_index :games, :name, :unique => true
  end

  def down
  	remove_index :games, :shortname
  	remove_index :games, :name
  end
end
