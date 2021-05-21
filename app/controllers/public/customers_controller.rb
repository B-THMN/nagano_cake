class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
    # @user = User.find(current_user.id)
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      # フラッシュメッセージ
      redirect_to customer_path(@customer)
    else
      render :edit
    end
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
