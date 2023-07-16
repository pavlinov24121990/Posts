module Admin
  class PostsController < ApplicationController
    before_action :find_post, only: %i[update show edit destroy]
    before_action :button_create_post

    def index
      @posts = Post.all
      
    end

    def update
      if @post.update(post_params)
        flash[:success] = "Post Updated"
        redirect_to admin_posts_path
      else
        render :edit
      end
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        flash[:success] = "Post Created"
        redirect_to admin_posts_path
      else
        render :new
      end
    end

    def edit
    end

    def show
    end

    def destroy
      if @post.destroy
        flash[:success] = "Post Deleted"
        redirect_to admin_posts_path
      else
        render :edit
      end
    end

    private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :title)
    end

    def button_create_post
      @creates = true
    end
  end

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
