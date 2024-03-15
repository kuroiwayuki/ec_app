class Product < ApplicationRecord
    # 関連付け
    has_many :cart_items
    has_many :order_items
  
    # バリデーション
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
  