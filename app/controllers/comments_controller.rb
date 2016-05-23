class CommentsController < ApplicationController
  before_action :set_comments
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET shops/1/comments
  def index
    @comments = @shop.comments
  end

  # GET shops/1/comments/1
  def show
  end

  # GET shops/1/comments/new
  def new
    @comment = @shop.comments.build
  end

  # GET shops/1/comments/1/edit
  def edit
  end

  # POST shops/1/comments
  def create
    @comment = @shop.comments.build(comment_params)

    if @comment.save
      redirect_to([@comment.shop, @comment], notice: 'Comment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT shops/1/comments/1
  def update
    if @comment.update_attributes(comment_params)
      redirect_to([@comment.shop, @comment], notice: 'Comment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE shops/1/comments/1
  def destroy
    @comment.destroy

    redirect_to shop_comments_url(@shop)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments
      @shop = Shop.find(params[:shop_id])
    end

    def set_comment
      @comment = @shop.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
