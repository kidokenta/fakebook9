class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @post = Post.new
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user= User.find(params[:id])
    @users = user.followers
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      flash[:success] = 'ユーザー情報を編集しました'
      render :edit
    else
      flash.now[:danger] = "ユーザー情報の編集に失敗しました"
      render :edit
    end
  end




end
