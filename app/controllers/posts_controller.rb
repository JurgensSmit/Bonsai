class PostsController < ApplicationController
before_filter :get_post, :except => [:index, :new, :create]
before_filter :check_for_mobile, :only => [:index]

    # GET /posts
  # GET /posts.json
      def index
         @posts = Post.scoped.paginate(page: params[:page], per_page: params[:per_page] || 6)
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
        if user_signed_in?
        @post = Post.new(params[:post])
        @post.user_id = current_user.id
          respond_to do |format|
              if @post.save
                format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
                  format.json { render json: @post, status: :created, location: @post }
              else
                  format.html { render action: "new" }
                  format.json { render json: @post.errors, status: :unprocessable_entity }
              end
              end
         else
         redirect_to :back
         flash[:notice]="Please sign in first"  
         end  
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
      respond_to do |format|
        if @post.update_attributes(params[:post])
          format.html { redirect_to post_path(@post), notice: 'Post was successfully updated.' }
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
    @post.destroy
     respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def likeunlike
      if user_signed_in? 
        if !@post.voted_by?(current_user)
          current_user.vote_for(@post)
          redirect_to :back
        else
          current_user.unvote_for(@post)
          redirect_to :back
        end
      else
        redirect_to new_user_registration_path
    end
  end

  def get_post
    @post = Post.find(params[:id])
  end


end