class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    # @user = User.find(current_user.id)
    @customer = current_customer
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
    @customer = current_customer
    # is_deletedをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    # flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  # 新規登録された時のストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email)
  end
end
