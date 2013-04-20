class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :space
      t.integer :type
      t.text :contents

      t.timestamps
    end
    add_index :tasks, :space_id
  end
end
