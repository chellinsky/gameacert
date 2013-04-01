class ChangeIdInSpaces < ActiveRecord::Migration
  def up
  	add_column :spaces, :game_id, :integer
  	remove_column :spaces, :gameid
  end

  def down
  	remove_column :spaces, :game_id
  	add_column :spaces, :gameid, :integer
  end
end
