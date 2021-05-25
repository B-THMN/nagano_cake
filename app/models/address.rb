class Address < ApplicationRecord
  belongs_to :customer, foreign_key: "customer_id"

  validates :customer_id, :name, :address, presence: true
  #配送先に送るにあたって、会員id,住所と宛名が空白でないこと

  validates :postcode, length: {is: 7}, numericality: { only_integer: true }
  #郵便番号は、数字７桁のみしか認めない
end
