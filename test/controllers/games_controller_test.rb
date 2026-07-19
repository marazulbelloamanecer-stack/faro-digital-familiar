require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get memory" do
    get games_memory_url
    assert_response :success
  end
end
