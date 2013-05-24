class Task < ActiveRecord::Base
  belongs_to :space

  has_many :user_tasks
  has_many :users, through: :user_tasks

  has_paper_trail

  attr_accessible :contents, :description, :name, :trainingtype, :order

end
