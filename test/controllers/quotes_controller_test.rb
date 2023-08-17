require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quotes_index_url
    assert_response :success
  end

  test "should get new" do
    get quotes_new_url
    assert_response :success
  end

  test "should get edit" do
    get quotes_edit_url
    assert_response :success
  end
end
