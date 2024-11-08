require "test_helper"

class RockPaperScissorsControllerTest < ActionDispatch::IntegrationTest
  test "should get check" do
    get rock_paper_scissors_check_url
    assert_response :success
  end
end
