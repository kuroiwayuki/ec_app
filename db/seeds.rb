# ユーザーデータの作成
users = [
  { email: 'user1@example.com', password: 'password1' },
  { email: 'user2@example.com', password: 'password2' }
]

users.each do |user_attributes|
  user = User.find_or_create_by(email: user_attributes[:email]) do |u|
    u.password = user_attributes[:password]
  end
end


# 商品データの作成
products = Product.create([
  { name: 'Ruby on Rails T-Shirt', description: 'Stylish and comfy.', price: 15.99, stock: 10 },
  { name: 'Ruby on Rails Mug', description: 'Start your morning with Ruby!', price: 8.99, stock: 5 },
  { name: 'Ruby on Rails Sticker', description: 'Decorate your laptop.', price: 2.99, stock: 20 }
])

# ユーザーデータの作成
users.each do |user_attributes|
  user = User.find_or_create_by(email: user_attributes[:email]) do |u|
    u.password = user_attributes[:password]
  end

  # 各ユーザーに対するカートデータの作成
  cart = Cart.create(user_id: user.id)

  # カートアイテムデータの作成
  CartItem.create([
    { cart_id: cart.id, product_id: products[0].id, quantity: 2 },
    { cart_id: cart.id, product_id: products[1].id, quantity: 1 }
  ])

  # 注文データの作成
  order = Order.create(user_id: user.id, total_price: 50.00, status: 'completed')

  # 注文詳細データの作成
  OrderItem.create([
    { order_id: order.id, product_id: products[0].id, quantity: 2, price: products[0].price },
    { order_id: order.id, product_id: products[1].id, quantity: 1, price: products[1].price }
  ])
end
