class CommentsController < ApplicationController
  before_action :post_find, only: %i[index create]

  def index
    @comment = Comment.new 
    @comments = @post.comments.order create_at:(:desc)
  end
  
  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_comments_path
      flash[:success] = "Comment created!"
    else
      render :index
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

   def post_find
    @post = Post.find(params[:post_id])
  end
end


