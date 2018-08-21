require 'test_helper'

class MyEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_events_index_url
    assert_response :success
  end

  test "should get new" do
    get my_events_new_url
    assert_response :success
  end

  test "should get show" do
    get my_events_show_url
    assert_response :success
  end

  test "should get edit" do
    get my_events_edit_url
    assert_response :success
  end

end
