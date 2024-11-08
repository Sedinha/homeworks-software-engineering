require "test_helper"

class AnagramsControllerTest < ActionDispatch::IntegrationTest
  test "should get check" do
    get anagrams_check_url
    assert_response :success
  end
end
