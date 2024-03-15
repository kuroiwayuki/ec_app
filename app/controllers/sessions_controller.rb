class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    binding.pry
    if user && user.authenticate(params[:session][:password])
      # ログイン成功
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      # ログイン失敗
      binding.pry
      flash.now[:danger] = 'メールアドレスまたはパスワードが間違っています'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
