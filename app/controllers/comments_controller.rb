class CommentsController < ApplicationController
 before_action :authenticate_user
 
 def create
   @post = Post.find(params[:post_id])
   @comment = Comment.new(comment_params)
   @comments = Comment.where(post_id: @post.id)
   if @comment.save
     flash[:success] = "コメントしました"
     redirect_to post_path(@post)
   else
     flash[:danger] = "コメントできませんでした"
     render "posts/show"
   end
 end
 
 private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: @current_user.id,post_id: params[:post_id])
  end
end