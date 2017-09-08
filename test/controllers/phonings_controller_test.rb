require 'test_helper'

class PhoningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phoning = phonings(:one)
  end

  test "should get index" do
    get phonings_url
    assert_response :success
  end

  test "should get new" do
    get new_phoning_url
    assert_response :success
  end

  test "should create phoning" do
    assert_difference('Phoning.count') do
      post phonings_url, params: { phoning: {  } }
    end

    assert_redirected_to phoning_url(Phoning.last)
  end

  test "should show phoning" do
    get phoning_url(@phoning)
    assert_response :success
  end

  test "should get edit" do
    get edit_phoning_url(@phoning)
    assert_response :success
  end

  test "should update phoning" do
    patch phoning_url(@phoning), params: { phoning: {  } }
    assert_redirected_to phoning_url(@phoning)
  end

  test "should destroy phoning" do
    assert_difference('Phoning.count', -1) do
      delete phoning_url(@phoning)
    end

    assert_redirected_to phonings_url
  end
end
