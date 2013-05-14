class Task < ActiveRecord::Base
  belongs_to :space

  has_many :completions
  has_many :users, through: :completions

  has_paper_trail

  attr_accessible :contents, :description, :name, :trainingtype
end
