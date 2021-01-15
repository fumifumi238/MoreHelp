class PostsController < ApplicationController
before_action :authenticate_user,{only: [:edit,:destroy,:new,:create]}
before_action :ensure_correct_user,{only: [:edit, :update, :destroy]}


  def index
     @search = Post.ransack(params[:q])
     @posts = @search.result.page(params[:page])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to posts_url
  end
  
  def update
     @post = Post.find(params[:id])
     if @post.update(post_params)
      flash[:success] = "プロフィールが更新されました"
      redirect_to @post
     else
      render "edit"
     end
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
   if @post.save
      flash[:success] = "投稿を作成しました"
      redirect_to posts_url
   else
      flash[:danger] = "投稿できませんでした"
      render "new"
   end
  end
  
  def  ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:danger] = "権限がありません"
      redirect_to posts_path
    end
  end



  private
    def post_params
      params.require(:post).permit(:content,:tag_id,:anonymous_check)
    end
  
 
end
