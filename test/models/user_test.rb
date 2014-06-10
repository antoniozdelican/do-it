require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without password" do
  	user = User.new(email: "user@email.com")
  	assert_not user.save
  end
end
