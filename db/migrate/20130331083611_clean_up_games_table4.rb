class CleanUpGamesTable4 < ActiveRecord::Migration
  def change
  	remove_column :games, :shortname
  end
end
