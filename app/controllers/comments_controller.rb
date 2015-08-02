class CommentsController < ApplicationController
  def create
    @user = User.find(session[:user]["id"])
    @post = Post.find(params[:post_id])
    @body = params.require(:comment).permit(:body)[:body]
    @comment = @user.comments.create(user: @user, post: @post, body: @body)
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = params[:post_id]
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end
  # remember to use strong_params when possible
end
