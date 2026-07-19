require "test_helper"

class ChatbotControllerTest < ActionDispatch::IntegrationTest
  test "should get ask" do
    get chatbot_ask_url
    assert_response :success
  end
end
