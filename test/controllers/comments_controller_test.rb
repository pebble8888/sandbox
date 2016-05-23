require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @shop = shops(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get :index, params: { shop_id: @shop }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { shop_id: @shop }
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, params: { shop_id: @shop, comment: @comment.attributes }
    end

    assert_redirected_to shop_comment_path(@shop, Comment.last)
  end

  test "should show comment" do
    get :show, params: { shop_id: @shop, id: @comment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { shop_id: @shop, id: @comment }
    assert_response :success
  end

  test "should update comment" do
    put :update, params: { shop_id: @shop, id: @comment, comment: @comment.attributes }
    assert_redirected_to shop_comment_path(@shop, Comment.last)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, params: { shop_id: @shop, id: @comment }
    end

    assert_redirected_to shop_comments_path(@shop)
  end
end
