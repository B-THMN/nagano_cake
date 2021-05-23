class CartItem < ApplicationRecord
  include ActionView::Helpers
   
  belongs_to :customer, foreign_key: "customer_id"
  belongs_to :item, foreign_key: "item_id"

  #validates :item_id, :customer_id, :quantity, presence: true
  #カート内には、空白を認めない

  validates :quantity, numericality: { only_integer: true }
  #カートアイテム内の数量は、数字のみ
end
