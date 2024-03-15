class ApplicationController < ActionController::Base
    helper_method :current_cart
    helper_method :current_user
  
    private
  
    def current_cart
      if user_signed_in?
        #userとcartを紐づけるたcartオブジェクトを作成。今後これを使いログイン済みユーザーは商品追加を行う
        cart = Cart.find_or_create_by(user_id: current_user.id)
        session[:cart_id] = cart.id unless session[:cart_id]
        cart
      else
        Cart.find(session[:cart_id])
      end
    end

    def current_user
      #ユーザーのセッション情報がある場合、そこからUserオブジェクトを作成し、@current_userに挿入し戻り値として返す。
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      
    end

    def user_signed_in?
      !!current_user
    
    end
  
    def authenticate_user
      redirect_to login_path unless current_user
    end
end
  