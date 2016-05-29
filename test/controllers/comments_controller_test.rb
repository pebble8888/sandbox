require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @shop = shops(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get :index, shop_id: @shop
    assert_response :success
  end

  test "should get new" do
    get :new, shop_id: @shop
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, 
          shop_id: @shop,
          comment: { id: @comment.id, shop_id: @comment.shop_id, content: @comment.content },
          authenticity_token: set_form_authenticity_token
    end

    assert_redirected_to shop_comment_path(@shop, Comment.last)
  end

  test "should show comment" do
    get :show,
        shop_id: @shop,
        id: @comment
    assert_response :success
  end

  test "should get edit" do
    get :edit,
        shop_id: @shop,
        id: @comment
    assert_response :success
  end

  test "should update comment" do
    put :update,
        shop_id: @shop,
        id: @comment,
        comment: { id: @comment.id, shop_id: @comment.shop_id, content: @comment.content },
        authenticity_token: set_form_authenticity_token
    assert_redirected_to shop_comment_path(@shop, Comment.last)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy,
            id: @comment,
            shop_id: @shop,
            authenticity_token: set_form_authenticity_token
    end

    assert_redirected_to shop_comments_path(@shop)
  end

  private
    def set_form_authenticity_token
      session[:_csrf_token] = SecureRandom.base64(32)
    end
end
