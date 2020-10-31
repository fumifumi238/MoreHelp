class CommentsController < ApplicationController
    
  def create
   @post = Post.find_by(params[:post_id])
   @comment = Comment.new(content: params[:content],user_id: @current_user.id,post_id: @post.id)
   @comments = Comment.where(post_id: @post.id)
   if @comment.save
     flash[:notice] = "コメントしました"
     redirect_to("/posts/#{@comment.post_id}")
   else
     flash[:notice] = "コメントできませんでした"
     render template: "posts/show"
   end
  end
end