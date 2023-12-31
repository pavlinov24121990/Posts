module Admin  
  class PostsController < ApplicationController
      before_action :find_post, only: %i[update show edit destroy]
      before_action :authenticate_user!, :admin_acces

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
        @user = current_user
        @post = @user.posts.new(post_params)
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

      def admin_acces
        unless current_user && current_user.status?
          flash[:alert] = 'Доступ запрещен.'
          redirect_to root_path
        end
      end
  end
end