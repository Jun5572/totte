require 'test_helper'

class MyAlbumItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get my_album_items_new_url
    assert_response :success
  end

  test "should get index" do
    get my_album_items_index_url
    assert_response :success
  end

  test "should get edit" do
    get my_album_items_edit_url
    assert_response :success
  end

end
