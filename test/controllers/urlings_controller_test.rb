require 'test_helper'

class UrlingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urling = urlings(:one)
  end

  test "should get index" do
    get urlings_url
    assert_response :success
  end

  test "should get new" do
    get new_urling_url
    assert_response :success
  end

  test "should create urling" do
    assert_difference('Urling.count') do
      post urlings_url, params: { urling: {  } }
    end

    assert_redirected_to urling_url(Urling.last)
  end

  test "should show urling" do
    get urling_url(@urling)
    assert_response :success
  end

  test "should get edit" do
    get edit_urling_url(@urling)
    assert_response :success
  end

  test "should update urling" do
    patch urling_url(@urling), params: { urling: {  } }
    assert_redirected_to urling_url(@urling)
  end

  test "should destroy urling" do
    assert_difference('Urling.count', -1) do
      delete urling_url(@urling)
    end

    assert_redirected_to urlings_url
  end
end
