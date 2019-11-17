require 'test_helper'

class WatchRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get watch_relations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get watch_relations_destroy_url
    assert_response :success
  end

end
