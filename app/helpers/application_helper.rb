module ApplicationHelper
  # 税込価格
  def purchase_price(price)
    (price * 1.1).round
  end

  def sub_price(sub)
    (purchase_price(sub.item.excluding_tax_price) * sub.quantity)
  end

  def total_price(totals)
    price = 0
    totals.each do |total|
      price  +=  sub_price(total)
    end
    return price
  end
end
