module ProductsHelper
  
  def print_price(price)
    if price != nil
    format( "%.2f PLN", price)
    end
  end

  def print_stock(stock, requested = 1)
    if stock == 0
      content_tag(:span, "Brak w magazynie", class: "out_stock")
    elsif stock > requested
      content_tag(:span, "W magazynie: #{stock}", class: "in_stock")
    else
      content_tag(:span, "Niewystarczająca ilość na magazynie(#{stock})", class: "low_stock")
    end
  end
end
