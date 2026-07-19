require "test_helper"

class ParentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get parents_new_url
    assert_response :success
  end

  test "should get create" do
    get parents_create_url
    assert_response :success
  end

  test "should get panel" do
    get parents_panel_url
    assert_response :success
  end
end
