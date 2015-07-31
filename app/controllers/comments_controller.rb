class CommentsController < ApplicationController
  def create
    @user = User.first #Will come from session when implemented
    @post = Post.find(params[:post_id])
    @body = params.require(:comment).permit(:body)
    @comment = @user.comments.create(user: @user, post: @post, body: @body)
    @comment.save
    redirect_to @post
  end
end
