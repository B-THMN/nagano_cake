class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many:items, through: :cart_items, dependent: :destroy
  has_many:cart_items, dependent: :destroy
  has_many:addresses, dependent: :destroy
  
  # 退会機能
  # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないようにする制約
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
