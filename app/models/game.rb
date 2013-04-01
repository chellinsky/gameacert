class Game < ActiveRecord::Base
  attr_accessible :description, :gamepic, :name, :short_name

  validates_presence_of :name, :short_name
  validates_uniqueness_of :name, :short_name

  has_many :spaces
end
