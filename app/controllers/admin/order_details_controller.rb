class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order_detail.production_status == "working"
    @order.order_status ="製作中"
    @order.save
    elsif @order_detail.production_status == "completed"
    @order.order_status ="発送準備中"
    @order.save
    end
    redirect_to admin_order_path(@order_detail.order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
