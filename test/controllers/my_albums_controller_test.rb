require 'test_helper'

class MyAlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get my_albums_new_url
    assert_response :success
  end

  test "should get index" do
    get my_albums_index_url
    assert_response :success
  end

  test "should get show" do
    get my_albums_show_url
    assert_response :success
  end

  test "should get edit" do
    get my_albums_edit_url
    assert_response :success
  end

end
