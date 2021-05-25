module ApplicationHelper
  
  # 税込価格
  def tax_price(price)
    (price * 1.1).round
  end
  
  # 小計
  def purchase_price(purchase)
    (tax_price(purchase.item.excluding_tax_price) * purchase.quantity)
  end
  
  # 商品合計金額
  def total_payment(totals)
    price = 0
    totals.each do |total|
      price  +=  purchase_price(total)
    end
    return price
  end
  
  # 請求金額
  def billing_amount(billing)
    total_payment(current_customer.cart_items) + @order.postage
  end
end
