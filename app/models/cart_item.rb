class CartItem < ApplicationRecord
  # 関連付け
  belongs_to :cart
  belongs_to :product

  # バリデーション
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
