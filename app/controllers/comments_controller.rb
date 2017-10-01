class CommentsController < ApplicationController
    def create
        
        @comment = Comment.new
        @comment.post_id = params[:post_id]
        @comment.user_id = params[:user_id]
        @comment.content = params[:comment]
        
        
        @comment.save
    end
    
    def destroy
        # @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:comment_id])
        @comment.destroy
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
