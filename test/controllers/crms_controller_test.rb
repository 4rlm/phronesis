require 'test_helper'

class CrmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crm = crms(:one)
  end

  test "should get index" do
    get crms_url
    assert_response :success
  end

  test "should get new" do
    get new_crm_url
    assert_response :success
  end

  test "should create crm" do
    assert_difference('Crm.count') do
      post crms_url, params: { crm: { crm_id: @crm.crm_id, source: @crm.source, type: @crm.type } }
    end

    assert_redirected_to crm_url(Crm.last)
  end

  test "should show crm" do
    get crm_url(@crm)
    assert_response :success
  end

  test "should get edit" do
    get edit_crm_url(@crm)
    assert_response :success
  end

  test "should update crm" do
    patch crm_url(@crm), params: { crm: { crm_id: @crm.crm_id, source: @crm.source, type: @crm.type } }
    assert_redirected_to crm_url(@crm)
  end

  test "should destroy crm" do
    assert_difference('Crm.count', -1) do
      delete crm_url(@crm)
    end

    assert_redirected_to crms_url
  end
end
