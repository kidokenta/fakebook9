class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
    @user = @post.user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    @post.save
    redirect_to posts_path

  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end
  

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:content,:image)
  end


end
