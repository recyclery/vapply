require 'test_helper'

class CaseworkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caseworker = caseworkers(:one)
  end

  test "should get index" do
    get caseworkers_url
    assert_response :success
  end

  test "should get new" do
    get new_caseworker_url
    assert_response :success
  end

  test "should create caseworker" do
    assert_difference('Caseworker.count') do
      post caseworkers_url, params: { caseworker: { address1: @caseworker.address1, address2: @caseworker.address2, created_at: @caseworker.created_at, email: @caseworker.email, limit: @caseworker.limit, name: @caseworker.name, organization: @caseworker.organization, phone: @caseworker.phone, updated_at: @caseworker.updated_at, user_id: @caseworker.user_id } }
    end

    assert_redirected_to caseworker_url(Caseworker.last)
  end

  test "should show caseworker" do
    get caseworker_url(@caseworker)
    assert_response :success
  end

  test "should get edit" do
    get edit_caseworker_url(@caseworker)
    assert_response :success
  end

  test "should update caseworker" do
    patch caseworker_url(@caseworker), params: { caseworker: { address1: @caseworker.address1, address2: @caseworker.address2, created_at: @caseworker.created_at, email: @caseworker.email, limit: @caseworker.limit, name: @caseworker.name, organization: @caseworker.organization, phone: @caseworker.phone, updated_at: @caseworker.updated_at, user_id: @caseworker.user_id } }
    assert_redirected_to caseworker_url(@caseworker)
  end

  test "should destroy caseworker" do
    assert_difference('Caseworker.count', -1) do
      delete caseworker_url(@caseworker)
    end

    assert_redirected_to caseworkers_url
  end
end
