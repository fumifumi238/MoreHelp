class PostsController < ApplicationController
  
  def index
    @posts = Post.all.page(params[:page])
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content],user_id: @current_user.id)
   if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
   else
      render("posts/new")
   end
  end

end
