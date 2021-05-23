class Item < ApplicationRecord
  include ActionView::Helpers
  belongs_to :genre, foreign_key: "genre_id"
  has_many :customers, through: :cart_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, through: :order_details, dependent: :destroy
  has_many :order_details, dependent: :destroy
  attachment :image, destroy: false

  #validates  :genre_id,:name, :excluding_tax_price, presence: true
  #ジャンルid,商品名、税抜き価格が空白でないこと

  #validates :introduction, length: {maximum: 500}
  #商品説明文の最大５００文字まで

  #validates :excluding_tax_price, numericality: { only_integer: true }
  #税抜き価格が数字であること
end
