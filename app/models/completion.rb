class Completion < ActiveRecord::Base
	belongs_to :user
	belongs_to :task

	has_paper_trail
end