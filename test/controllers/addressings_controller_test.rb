require 'test_helper'

class AddressingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @addressing = addressings(:one)
  end

  test "should get index" do
    get addressings_url
    assert_response :success
  end

  test "should get new" do
    get new_addressing_url
    assert_response :success
  end

  test "should create addressing" do
    assert_difference('Addressing.count') do
      post addressings_url, params: { addressing: {  } }
    end

    assert_redirected_to addressing_url(Addressing.last)
  end

  test "should show addressing" do
    get addressing_url(@addressing)
    assert_response :success
  end

  test "should get edit" do
    get edit_addressing_url(@addressing)
    assert_response :success
  end

  test "should update addressing" do
    patch addressing_url(@addressing), params: { addressing: {  } }
    assert_redirected_to addressing_url(@addressing)
  end

  test "should destroy addressing" do
    assert_difference('Addressing.count', -1) do
      delete addressing_url(@addressing)
    end

    assert_redirected_to addressings_url
  end
end
