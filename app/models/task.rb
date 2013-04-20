class Task < ActiveRecord::Base
  belongs_to :space
  attr_accessible :contents, :description, :name, :type
end
