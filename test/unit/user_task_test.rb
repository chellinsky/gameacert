require 'test_helper'

class UserTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:user)
  should belong_to(:task)

  test "that completing a atask works without raising an exception" do
  	assert_nothing_raised do
  		UserTask.create user: users(:bob), task: tasks(:one)
  	end
  end

  test "that completing a task based on user_id and task_id works" do
  	UserTask.create user_id: users(:bob).id, task_id: tasks(:one).id
  	assert users(:bob).tasks.include?(tasks(:one))
  end

end
