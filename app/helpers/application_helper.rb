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

  def format_event_date(date1, date2)
    if date1.nil?
      "Data da confermare"
    else
      f_date1 = I18n.l(date1, format: :event_long_date).to_s
      f_date1_h = I18n.l(date1, format: :event_long_full).to_s
      if !date2.nil?
        f_date2 = I18n.l(date2, format: :event_long_date).to_s
        if date2.to_date != date1.to_date
          "Da " + f_date1 + " a " + f_date2
        else
          f_date1_h.capitalize + " – #{date2.strftime("%H:%M")}"
        end
      else
        if date1.strftime("%H:%M") == "00:00"
          f_date1.capitalize
        else
          f_date1_h.capitalize
        end
      end
    end
  end

  def format_card_date(date1, date2)
    if date1.nil?
      "Data da confermare"
    else
      f_date1 = I18n.l(date1, format: :event_short).to_s
      if date2.nil? || date2.to_date == date1.to_date
        if date1.strftime("%H:%M") == "00:00"
          f_date1
        else
          f_date1 +", ore #{date1.strftime("%H:%M")}"
        end
      else
        f_date2 = I18n.l(date2, format: :event_short).to_s
        f_date1 + " – " + f_date2
      end
    end
  end

  def chapter(word)
    word.nil?
  end

end
