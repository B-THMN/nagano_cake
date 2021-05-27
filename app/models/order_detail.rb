class OrderDetail < ApplicationRecord
  belongs_to :item, foreign_key: "item_id"
  belongs_to :order, foreign_key: "order_id"


  validates  :order_id,:item_id, :quantity,:purchase_price, presence: true
  #(注文id,商品id,数量、購入時価格が空でないバリデーション)

  validates :quantity, :purchase_price, numericality: { only_integer: true }
  #(数量、購入時価格は数字)

  #(enumで製作ステータスの管理をしている)
  enum production_status:{
    waiting:           0, #着手不可
    pending:           1, #製作待ち
    working:           2, #製作中
    completed:         3 #製作完了
  }
end
