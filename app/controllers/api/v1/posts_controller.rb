module Api
  module V1
    class PostsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_post, except: [:index, :create]
    
      def index
        @posts = Post.all.order("updated_at DESC")
        render json: { posts: @posts }, status: 200
      end
    
      def show
        if @post.present?
          render json: { posts: @posts }, status: 200
        else
          render json: { error: "The post you are requesting is not available" }, status: 422
        end
      end
    
      def create
        @post = Post.new(post_params)
    
        if @post.save
          render json: { post: @post, notice: "Successfully created the post" }, status: 201
        else
          render json: { error: @post.error }, status: 422
        end
      end
    
      def update
        if @post.update(post_params)
          render json: { post: @post, notice: "Successfully updated the post" }, status: 200
        else
          render json: { error: @post.error }, status: 422
        end
      end
    
      def destroy
        if @post.destroy
          render json: { notice: "Successfully deleted the post" }, status: 200
        else
          render json: { error: @post.error }, status: 422
        end
    
      end
    
      private
        def set_post
          @post = Post.find(params[:id])
        end
    
        def post_params
          params.require(:post).permit(:title, :description)
        end
    end
    
  end
end
