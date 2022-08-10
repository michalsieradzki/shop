module ProductsHelper
  
  def print_price(price)
    if price != nil
    format( "%.2f PLN", price)
    end
  end

  def print_stock(stock, requested = 1)
    if stock == 0
      "Brak w magazynie!"
    elsif stock > requested
      "W magazynie"
    else
      content_tag(:span, "Niewystarczająca ilość na magazynie(#{stock})", class: "low_stock")
    end
  end
end
