class CommentsController < ApplicationController
before_filter :get_post, :get_user

  def create
      if user_signed_in?
     @comment = @post.comments.build(params[:comment])
     @comment.user = current_user
     @comment.save
      redirect_to root_path
      flash[:notice] = "comment successfully created"
   else
     redirect_to root_path
     flash[:notice] = "comment NOT successfully created"
    end
    end

  def destroy
   @comment = @post.comment.find(params[:id])
   @comment.destroy
   redirect_to root_path
  end

  private
    def get_post
    @post=@user.posts.find(params[:post_id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end
  
end