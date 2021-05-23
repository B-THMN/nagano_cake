class Public::ItemsController < ApplicationController
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
    @item = Item.find(params[:id])
    @utems = Item.all
  end
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :excluding_tax_price, :is_active )
  end
end