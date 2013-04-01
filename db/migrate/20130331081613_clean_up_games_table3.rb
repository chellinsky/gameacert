class CleanUpGamesTable3 < ActiveRecord::Migration
  def change
  	add_column :games, :short_name, :string
  end
end
