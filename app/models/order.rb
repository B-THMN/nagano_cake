class Order < ApplicationRecord
	include ActionView::Helpers
    belongs_to :customer, foreign_key: "customer_id"
    has_many :items, through: :order_details, dependent: :destroy
	has_many :order_details, dependent: :destroy

	validates :customer_id, :postcode,:address, :name,:postage, :total_payment,:payment_method,presence: true


	#（会員、配送先住所、配送先氏名、送料、請求額、支払い方法、注文ステータスが空でないバリデーション）

	validates :postcode, length: {is: 7}, numericality: { only_integer: true } 
	# (郵便番号のバリデーション)

	#enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
	enum order_status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}
	#(上記2つはenumを使用し、管理している）


end
