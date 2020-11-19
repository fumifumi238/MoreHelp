class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが間違っています'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to login_path
  end
end
