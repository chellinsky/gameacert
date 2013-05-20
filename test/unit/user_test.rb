require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should have_many(:user_tasks)
  should have_many(:tasks)

  test "that no error is raised when trying to get to a completed task" do
  	assert_nothing_raised do
  		users(:bob).tasks
  	end
  end

  test "that completing tasks on a user works" do
  	users(:bob).tasks << tasks(:one)
  	users(:bob).tasks.reload
  	assert users(:bob).tasks.include?(tasks(:one))
  end

end
