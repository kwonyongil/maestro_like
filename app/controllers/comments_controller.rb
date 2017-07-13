class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new
        @comment.content = params[:comment]
        @comment.user_id = current_user.id
       
        @comment.save
    
        redirect_to @post
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        
        @comment.destroy
    
        
        redirect_to @post
    end
    
    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.content = params[:comment]
        @comment.user_id = params[:user_id]
        @comment.save
        
        redirect_to @post
    end
    
end
