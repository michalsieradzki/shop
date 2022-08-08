module ProductsHelper
  
  def print_price(price)
    format( "%.2f PLN", price)
  end

  def print_stock(stock)
    if stock > 0
      "#{stock}"
    else
      "Brak!"
    end
  end
end
