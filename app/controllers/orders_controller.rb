class OrdersController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_user
  def new
    @order = Order.new
    @cart_items = current_cart.cart_items
    # binding.pry
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total_price = calculate_total(@cart_items)

    if @order.save
      session.delete(:cart_id) # カートをクリア
      redirect_to @order, notice: '注文が完了しました。'
    else
      render :new
    end
  end

  # その他のアクション...

  private

  def order_params
    params.require(:order).permit(:address, :payment_method) # 必要に応じて調整
  end

  def calculate_total(cart_items)
    cart_items.inject(0) { |sum, item| sum + item.total_price }
  end
end
