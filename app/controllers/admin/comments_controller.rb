module Admin
  class CommentsController < ApplicationController
    before_action :button_create_post
    before_action :comment_find
    before_action :post_find, only: %i[update show edit destroy]

    def show
    end

    def edit
      @admin = :admin
    end

    def destroy
      if @comment.destroy
        flash[:success] = "Comment Deleted"
        render 'admin/posts/show'
      else
        render :edit
      end
    end

    def update
      if @comment.update(comment_params)
        flash[:success] = "Comment Updated"
        render 'admin/posts/show'
      else
        render :edit
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def comment_find
      @comment = Comment.find(params[:id])
    end

    def post_find
      @post = Post.find(params[:post_id])
    end

    def button_create_post
      @creates = true
    end

  end

end
