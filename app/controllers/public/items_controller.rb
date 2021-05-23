class Public::ItemsController < ApplicationController
  # before_action :authenticate_cusromer!, only: [:show]
  
  def top
    @items = Item.limit(4).order(created_at: :desc)
    @genres = Genre.all
  end
  
  def about
  end
 
  def index
    @items = Item.all
    @genres = Genre.all
  end
 
 def show
    @items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
 end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :excluding_tax_price, :is_active )
  end
end
