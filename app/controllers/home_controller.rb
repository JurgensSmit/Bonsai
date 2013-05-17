class HomeController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all

    @posts = Post.paginate(:page => params[:page], :per_page => 6)
  end
end
