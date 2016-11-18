require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
setup do
    @user = users(:one)
    @user2 = User.new(name: "ex2asd", email: "exuser@ex.com")
  end
  test "name should not be too short" do
    @user.name = "a"
    assert_not @user.valid?
  end

  test "email should be valid email format" do
    @user.email = "emailemailemailcom"
    assert_not @user.valid?
  end

  test "name should be unique" do
    @user2.name = @user.name
    assert_not @user2.valid?
  end

  test "email should be unique" do
   
    @user2.email = @user.email
    assert_not @user2.valid?
  end

  test "has email" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "has name" do
    @user.name = ""
    assert_not @user.valid?
  end
  
end
