class PostsController < ApplicationController
    # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(:page => params[:page])
    #BEFORE MY MERGE
    #@posts = @user.posts
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.js
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
@post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
      format.html { redirect_to user_posts_path(@user), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to user_posts_url(@user), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
     respond_to do |format|

      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

 def like
    @post= Post.find(params[:id])
    @post.liked_by current_user
    redirect_to :back
    flash[:notice]="Liked!" 
  end
def home
  @posts = Post.where(:user_id => current_user.id).paginate(:page => params[:page])
end
  
end

end