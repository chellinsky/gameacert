class UserTask < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :user
  belongs_to :task

  attr_accessible :user, :task, :user_id, :task_id

end
