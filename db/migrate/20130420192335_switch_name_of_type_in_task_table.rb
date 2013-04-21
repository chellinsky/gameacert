class SwitchNameOfTypeInTaskTable < ActiveRecord::Migration
  def change
  	rename_column :tasks, :type, :trainingtype
  end
end
