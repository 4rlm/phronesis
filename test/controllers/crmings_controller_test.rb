require 'test_helper'

class CrmingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crming = crmings(:one)
  end

  test "should get index" do
    get crmings_url
    assert_response :success
  end

  test "should get new" do
    get new_crming_url
    assert_response :success
  end

  test "should create crming" do
    assert_difference('Crming.count') do
      post crmings_url, params: { crming: {  } }
    end

    assert_redirected_to crming_url(Crming.last)
  end

  test "should show crming" do
    get crming_url(@crming)
    assert_response :success
  end

  test "should get edit" do
    get edit_crming_url(@crming)
    assert_response :success
  end

  test "should update crming" do
    patch crming_url(@crming), params: { crming: {  } }
    assert_redirected_to crming_url(@crming)
  end

  test "should destroy crming" do
    assert_difference('Crming.count', -1) do
      delete crming_url(@crming)
    end

    assert_redirected_to crmings_url
  end
end
