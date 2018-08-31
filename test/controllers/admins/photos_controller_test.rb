require 'test_helper'

class Admins::PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_photos_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_photos_show_url
    assert_response :success
  end

end
