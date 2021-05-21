class Public::ItemsController < ApplicationController
  def top
    @item = Item.all.order(created_at: :desc)
    @genres = Genre.all
  end

  def about
  end

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @utems = Item.all
  end
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :excluding_tax_price, :is_active )
  end
end