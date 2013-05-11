class RemoveSurveyorTable < ActiveRecord::Migration
  def up
  	drop_table :survey_translations
  end

  def down
  end
end
