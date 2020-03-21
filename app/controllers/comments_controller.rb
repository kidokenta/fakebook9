class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to "#"
    # comment = current_user.comments.build(post_id: params[:post_id])
    # comment.save
    # redirect_to posts_path

  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
