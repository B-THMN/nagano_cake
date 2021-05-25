class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  # 注文履歴一覧
  def index
    @orders = current_customer.orders
  end

  # 注文情報入力
  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end

  # 注文履歴詳細
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_de
  end

  # 注文情報確認画面
  def check
    @cart_items = current_customer.cart_items
    # params[:order][:payment_method]
		@order = Order.new
		# ストロングパラメータのtotal_paymentに値を代入する
		# @order.total_payment = billing(@order)
		# if文でshipping_adressesの値を受け取り各々の処理を書く
		# 自分の住所
    if params[:order][:addresses] == "residence"
      @order.postcode = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    # 登録済住所
    elsif params[:order][:addresses] == "shipping_addresses"
      ship = Address.find(params[:order][:order_address])
      @order.postcode = ship.postcode
      @order.address = ship.address
      @order.name = ship.name

    # 新しいお届け先
    elsif params[:order][:addresses] == "new_address"
      @address = Address.new(address_params)
      @address.save
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    end

  end

  # 注文情報確定
  def create
    # @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_complete_path
  end

  # 注文完了
  def complete
    # 注文が完了したらカート内の商品を全て消す
    cart_items = current_customer.cart_items
    cart_items.destroy_all
  end

  private
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :payment_method, :total_payment)
  end

  # 配送先テーブルにtext_field_tagを使ってデータ保存
  def address_params
    params.require(:address).permit(:postcode, :address, :name).merge(customer_id: current_customer.id)
  end
end
