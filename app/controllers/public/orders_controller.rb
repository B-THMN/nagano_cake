class Public::OrdersController < ApplicationController
  def index
    @oders = current_customer.orders
  end

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def show
    @oder = Oder.find(params[:id])
    @oder_details = @oder.oder_de
  end

  def check
  end

  def create
  end

  def complete
  end
end
