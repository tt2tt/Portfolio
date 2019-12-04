require 'test_helper'

class DescribesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get describes_index_url
    assert_response :success
  end

  test "should get new" do
    get describes_new_url
    assert_response :success
  end

  test "should get show" do
    get describes_show_url
    assert_response :success
  end

  test "should get edit" do
    get describes_edit_url
    assert_response :success
  end

end
