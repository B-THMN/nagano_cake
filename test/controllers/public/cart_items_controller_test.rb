require 'test_helper'

class Public::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cart_items_index_url
    assert_response :success
  end

  test "should get create" do
    get public_cart_items_create_url
    assert_response :success
  end

  test "should get updae" do
    get public_cart_items_updae_url
    assert_response :success
  end

  test "should get destroy" do
    get public_cart_items_destroy_url
    assert_response :success
  end

  test "should get destroy_aii" do
    get public_cart_items_destroy_aii_url
    assert_response :success
  end

end
