module ApplicationHelper

  def format_date(date)
    date.strftime('%d %b %Y')
  end

  def dollar_random(min, max)
    (rand * (100-1) + 1).round(0) + 0.95
  end
end
