class OrderDetail < ApplicationRecord
  belongs_to :item, foreign_key: "item_id"
  belongs_to :order, foreign_key: "order_id"
  
  
  #validates  :order_id,:item_id, :quantity,:purchase_price, presence: true
  #(注文id,商品id,数量、購入時価格が空でないバリデーション)
  
  #validates :quantity, :purchase_price, numericality: { only_integer: true }
  #(数量、購入時価格は数字)
  
  enum produciton_status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}
  #(enumで製作ステータスの管理をしている)
end
