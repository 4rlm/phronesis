require 'test_helper'

class OrgingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orging = orgings(:one)
  end

  test "should get index" do
    get orgings_url
    assert_response :success
  end

  test "should get new" do
    get new_orging_url
    assert_response :success
  end

  test "should create orging" do
    assert_difference('Orging.count') do
      post orgings_url, params: { orging: {  } }
    end

    assert_redirected_to orging_url(Orging.last)
  end

  test "should show orging" do
    get orging_url(@orging)
    assert_response :success
  end

  test "should get edit" do
    get edit_orging_url(@orging)
    assert_response :success
  end

  test "should update orging" do
    patch orging_url(@orging), params: { orging: {  } }
    assert_redirected_to orging_url(@orging)
  end

  test "should destroy orging" do
    assert_difference('Orging.count', -1) do
      delete orging_url(@orging)
    end

    assert_redirected_to orgings_url
  end
end
