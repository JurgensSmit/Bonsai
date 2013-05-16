class PostsController < ApplicationController
  before_filter :get_user
  # GET /posts
  # GET /posts.json
  def index
    @posts = @user.posts
    @posts = Post.paginate(:page => params[:page], :per_page => 1)
    #BEFORE MY MERGE
    #@posts = @user.posts
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = @user.posts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = @user.post.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = @user.post.build(params[:post])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @user.post.build(params[:post])

    respond_to do |format|
      if @post.save
      format.html { redirect_to user_post_path[@user, @post], notice: 'Post was successfully created.' }
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
    @post = @user.post.find(params[:id])
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
    @post = @user.posts.find(params[:id])
    @post.destroy
     respond_to do |format|

      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

 def upvote
    @post= @user.post.find(params[:id])
     if !@post.liked_by current_user
    @post.liked_by current_user
  end
    redirect_to :back
    flash[:notice]="Liked!" 
  end

  private
    def get_user
      @user = User.find(params[:user_id])
    end

end
