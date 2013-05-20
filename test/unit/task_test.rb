require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should have_many(:user_tasks)
  should have_many(:users)

end
