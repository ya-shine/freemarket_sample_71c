class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)
    @comments = @item.comments.order(created_at: :desc)
    @comment.user_id = current_user.id
    if @comment.save
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      @comments = Comment.where(item_id: params[:item_id]).order(created_at: :desc)
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :item_id)
  end
  
end
