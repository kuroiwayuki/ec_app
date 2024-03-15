class Order < ApplicationRecord
  # 関連付け
  belongs_to :user
  has_many :order_items, dependent: :destroy

  # バリデーション
  validates :status, presence: true
end
