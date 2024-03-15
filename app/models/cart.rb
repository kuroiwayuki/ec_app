class Cart < ApplicationRecord
  # 関連付け
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
end
