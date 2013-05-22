require 'test_helper'

class AddACompletionTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def sign_in_as(user, password)
  	post login_path, user: { email: user.email, password: password }
  end

  test "that marking something complete works" do
  	sign_in_as users(:bob), "testing"

  	get "/user_tasks/new?task_id=#{tasks(:one).id}"
  	assert_response :success
  	assert_difference 'UserTask.count' do
  		post "/user_tasks", user_task: { task_id: tasks(:one).id }
  		assert_response :redirect
  		assert_equal "You successfully marked task #{tasks(:one).name} complete", flash[:success]
  	end
  end

end
