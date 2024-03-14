class CommentsController < ApplicationController
  before_action :set_blog
  before_action :set_comment, only: [ :edit, :update, :destroy ]

  def edit; end

  def create
    @comment = @blog.comments.build(comment_params.merge(user_id: current_user.id))
    @comment.save
    turbo_stream
  end

  def update
    @comment.update(comment_params)
    turbo_stream
  end

  def destroy
    @comment.destroy
    turbo_stream
  end

  private

    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
