require 'test_helper'

class CaseworkersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @caseworker = caseworkers(:one)
    @user = users(:user) #User.first
    @admin = users(:admin) #Admin.first
  end

  test "sign in user" do
    get :sign_in
    assert_response :success
    assert_select "h1", "The Recyclery"

    sign_in :user, @user
    get :sign_in
    assert_response :success
    assert_select "h1", "The Recyclery"
    assert_select "div", "Show clients"
  end

  test "sign in admin" do
    get :sign_in
    assert_response :success
    assert_select "h1", "The Recyclery - Caseworker's Portal"

    sign_in :user, @admin
    get :sign_in
    assert_response :success
    assert_select "h1", "The Recyclery - Caseworker's Portal"
    assert_select "div", "Show caseworkers"
  end

  test "should get index" do
    get :index
    assert_redirected_to new_user_session_path

    sign_in :user, @user
    get :index
    assert_redirected_to new_user_session_path

    sign_in :user, @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:caseworkers)
  end

  test "should get new" do
    get :new
    assert_redirected_to new_user_session_path

    sign_in :user, @user
    get :new
    assert_redirected_to new_user_session_path

    sign_in :user, @admin
    get :new
    assert_response :success
  end

  test "should create caseworker" do
    post :create, :caseworker => @caseworker.attributes
    assert_redirected_to new_user_session_path

    sign_in :user, @admin
    assert_difference('Caseworker.count') do
      post :create, :caseworker => @caseworker.attributes
    end

    assert_redirected_to caseworker_path(assigns(:caseworker))
  end

  test "should show caseworker" do
    get :show, :id => @caseworker.to_param
    assert_redirected_to new_user_session_path

    sign_in :user, @user
    get :show, :id => @caseworker.to_param
    assert_response :success

    sign_in :user, @admin
    get :show, :id => @caseworker.to_param
    assert_response :success
  end

  test "should get edit" do
    sign_in :user, @user
    get :edit, :id => @caseworker.to_param
    assert_response :success
  end

  test "should update caseworker" do
    put :update, :id => @caseworker.to_param, :caseworker => @caseworker.attributes
    assert_redirected_to new_user_session_path

    sign_in :user, @user
    put :update, :id => @caseworker.to_param, :caseworker => @caseworker.attributes
    assert_redirected_to caseworker_path(assigns(:caseworker))
  end

  test "should destroy caseworker" do
    delete :destroy, :id => @caseworker.to_param
    #assert_response 302 # Redirected to admin login
    assert_redirected_to new_user_session_path

    sign_in :user, @admin
    assert_difference('Caseworker.count', -1) do
      delete :destroy, :id => @caseworker.to_param
    end

    assert_redirected_to caseworkers_path
  end
end
