class Public::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def show
  end

  def check
  end

  def create
  end

  def complete
  end
end
