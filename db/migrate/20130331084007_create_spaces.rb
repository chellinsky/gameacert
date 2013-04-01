class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :topic
      t.text :detail
      t.integer :gameid
      t.integer :gameorder

      t.timestamps
    end
  end
end
