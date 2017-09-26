require 'test_helper'

class BoardsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @board = boards(:one)
    @user = users(:user)
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in :user, @user
    get :index
    assert_response :success
    assert_not_nil assigns(:boards)
  end

  test "should get new" do
    sign_in :user, @user
    get :new
    assert_response :success
  end

  test "should create board" do
    sign_in :user, @user
    assert_difference('Board.count') do
      post :create, :board => @board.attributes
    end

    assert_redirected_to board_path(assigns(:board))
  end

  test "should show board" do
    sign_in :user, @user
    get :show, :id => @board.to_param
    assert_response :success
  end

  test "should get edit" do
    sign_in :user, @user
    get :edit, :id => @board.to_param
    assert_response :success
  end

  test "should update board" do
    sign_in :user, @user
    put :update, :id => @board.to_param, :board => @board.attributes
    assert_redirected_to board_path(assigns(:board))
  end

  test "should destroy board" do
    sign_in :user, @user
    assert_difference('Board.count', -1) do
      delete :destroy, :id => @board.to_param
    end

    assert_redirected_to boards_path
  end
end
