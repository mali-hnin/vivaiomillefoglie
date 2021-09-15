module ApplicationHelper
  include Pagy::Frontend

  def cart_count_over_one
    if @cart.line_items.count > 0
      return "#{@cart.line_items.count}".html_safe
    end
  end

  def cart_count
    return "#{@cart.line_items.sum(:quantity)}".html_safe
  end

  def cart_has_items
    return @cart.line_items.count > 0
  end

  def format_event_date(date, format = :long)
    if date.blank?
      "Data da confermare"
    else
      date.to_s(format)
    end
  end

end
