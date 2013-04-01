class Space < ActiveRecord::Base
  attr_accessible :detail, :gameid, :gameorder, :name, :topic

  belongs_to :game
end
