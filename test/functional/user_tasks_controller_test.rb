require 'test_helper'

class UserTasksControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  include Devise::TestHelpers

  context "#new" do
  	context "when not logged in" do
  		should "redirect to login page" do
  			get :new
  			assert_response :redirect
  		end
  	end
  	context "when logged in" do
  		setup do
  			sign_in users(:bob)
  		end

  		should "get new page" do
  			get :new
  			assert_response :success
  		end

  		should "send an error if no task is present" do
  			get :new, {}
  			assert_equal "Task required", flash[:error]
  		end

  		should "display the tasks's name" do
  			get :new, task_id: tasks(:one).id
  			assert_match /#{tasks(:one).name}/, response.body
  		end

  		should "assign a new user task completion to the correct task" do
  			get :new, task_id: tasks(:one)
  			assert_equal tasks(:one).id, assigns(:user_task).task_id
  		end

  		should "assign a new user task completion to the current user" do
  			get :new, task_id: tasks(:one)
  			assert_equal users(:bob).id, assigns(:user_task).user_id
  		end

  		should "return 404 if no task is found" do
  			get :new, task_id: 'invalid'
  			assert_response :not_found
  		end

  	end
  end

  context "#create" do
    context "when not logged in" do
      should "redirect to login page" do
        get :create
        assert_response :redirect
        assert_redirected_to login_path
      end
    end
    context "when logged in" do
      setup do
        sign_in users(:bob)
      end

      context "with no task_id" do
        setup do
          post :create
        end

        should "set the flash error message" do
          assert !flash[:error].empty?
        end

        should "redirect to root path" do
          assert_redirected_to root_path
        end
      end

      context "with a valid task_id" do
        setup do
          post :create, user_task: { task_id: tasks(:one) }
        end

        should "assign a task object" do
          assert assigns(:task)
          assert_equal tasks(:one), assigns(:task)
        end

        should "assign a user_task object" do
          assert assigns(:user_task)
          assert_equal users(:bob), assigns(:user_task).user
          assert_equal tasks(:one), assigns(:user_task).task
        end

        should "mark completion" do
          assert users(:bob).tasks.include?(tasks(:one))
        end

        should "redirect to task page" do
          assert_response :redirect
          assert_redirected_to space_tasks_path(tasks(:one).space_id)
        end

        should "set the flash success message" do
          assert flash[:success]
          assert_equal "You successfully marked task #{tasks(:one).name} complete", flash[:success]
        end
      end
    end
  end

end
