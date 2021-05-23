class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many:items, through: :cart_items, dependent: :destroy
  has_many:cart_items, dependent: :destroy
  has_many:addresses, dependent: :destroy

  #会員詳細ページに氏名を書くために、定義してあります。（INDEXページの１６行目参照）
  def full_name
    self.last_name + self.first_name
  end
  # 退会機能
  # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないようにする制約
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
