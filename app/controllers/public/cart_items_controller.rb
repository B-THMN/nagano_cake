class Public::CartItemsController < ApplicationController
   helper_method :current_customer
   
  def index
    @cart_items = current_cart
  end

  def create
    
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end
end
