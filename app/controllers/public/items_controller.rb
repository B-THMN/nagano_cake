class Public::ItemsController < ApplicationController
  def top
  end

  def about
  end

  def index
    @items = Item.all
  end

  def show
  end
end
