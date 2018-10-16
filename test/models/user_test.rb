require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should get first name" do
    assert admin_users(:rosa).first_name == 'Rosa'
  end

  test "should get last name" do
    assert admin_users(:rosa).last_name == "Mohammadi"
  end

  test "should get email" do
    assert admin_users(:rosa).email == "rm@gmail.com"
  end

  test "should get username" do
    assert admin_users(:rosa).username == "rosamohammadi"
  end

  test "should delete user" do
    before_size = AdminUser.all.size
    AdminUser.delete(admin_users(:rosa))
    after_size = AdminUser.all.size
    assert after_size == before_size - 1
  end

  # test "should create new user" do
  #   before_size = AdminUser.all.size
  #   AdminUser.create(admin_users(:rosa))
  #   after_size = AdminUser.all.size
  #   assert after_size == before_size + 1
  # end


end
