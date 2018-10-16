require 'test_helper'

class AdminUsersControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get admin_users_path
    assert_response :redirect || :success
  end

  test "should get new" do
    get new_admin_user_path
    assert_response :redirect || :success
  end


  test "should get edit" do
    get edit_admin_user_path(admin_users(:rosa).id)
    assert_response :redirect || :success
  end

  test "should get delete" do
    get delete_admin_user_path(admin_users(:rosa).id)
    assert_response :redirect || :success
  end

end
