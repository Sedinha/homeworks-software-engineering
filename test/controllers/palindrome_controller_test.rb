require "test_helper"

class PalindromeControllerTest < ActionDispatch::IntegrationTest
  test "should get check" do
    get palindrome_check_url
    assert_response :success
  end
end
