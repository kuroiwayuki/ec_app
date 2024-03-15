class CartItemsController < ApplicationController
  

  def create
    @cart_item = current_cart.cart_items.new(product_id: params[:product_id], quantity: 1)
    # binding.pry
    
    if @cart_item.save
      redirect_to @cart_item.cart, notice: '商品をカートに追加しました。'
    else
      redirect_to products_url, alert: '商品の追加に失敗しました。'
    end
  end

  def show
    @cart_item = CartItem.find(params[:id])
    # binding.pry
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_cart), notice: '商品をカートから削除しました。'
  end

  
end
