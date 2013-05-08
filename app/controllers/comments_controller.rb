class CommentsController < ApplicationController
  def create
    if user_signed_in?
   @post = Post.find(params[:post_id])
   @comment = @post.comments.build(params[:comment])
   @comment.save
 else
   redirect_to root_path
  end

  def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
   redirect_to root_path
  end
end