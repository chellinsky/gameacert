class Space < ActiveRecord::Base
  attr_accessible :detail, :gameid, :gameorder, :name, :topic

  belongs_to :game
  has_many :tasks
  has_paper_trail
  
end
