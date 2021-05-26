class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
  @cart_item = current_customer.cart_items.build(cart_item_params)
  @cart_items = current_customer.cart_items.all
  @cart_items.each do |cart_item|
    if cart_item.item_id == @cart_item.item_id
      new_quantity = cart_item.quantity + @cart_item.quantity
      cart_item.update_attribute(:quantity, new_quantity)
      @cart_item.delete
    end
  end
  @cart_item.save
  # flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
  redirect_to :cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity])
    # flash.now[:success] = "#{@cart_item.product.name}の数量を変更しました"
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    # flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id).merge(customer_id: current_customer.id)
  end

end
