class User < ApplicationRecord
  has_secure_password
  # 関連付け
  has_many :carts
  has_many :orders
end
