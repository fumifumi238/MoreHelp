class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update, :show]}
  before_action :admin_user,{only: [:index,:destroy]}
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.page(params[:page]).per(10)
  end

  def index
    @users = User.page(params[:page]).per(30)
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:success] = "プロフィールが更新されました"
      redirect_to @user
     else
      render 'edit'
     end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーが削除されました"
    redirect_to users_path
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i && !@current_user.admin
      flash[:danger] = "権限がありません"
      redirect_to posts_path
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
    
    
    def admin_user
       unless @current_user.admin?
         flash[:danger] = "管理者権限がありません"
         redirect_to posts_path
       end
    end
end
