class Public::CustomerController < ApplicationController

  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  # 新規登録された時のストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email)
  end
end
