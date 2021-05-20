class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!
   
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
   if @item.save
    redirect_to admin_items_path(@item.id)
   else
    render :new
   end
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)

  end
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :excluding_tax_price, :is_active )
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :excluding_tax_price, :is_active )
  end
end