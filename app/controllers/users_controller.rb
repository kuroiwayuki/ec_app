class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      # 保存に成功した場合、ログインさせるなどの処理をここに記述
      session[:user_id] = @user.id
      binding.pry
      redirect_to user_path(@user), notice: 'ユーザー登録が完了しました。'
    else
      # 保存に失敗した場合、新規登録フォームを再表示
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
