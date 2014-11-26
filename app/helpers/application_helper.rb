module ApplicationHelper

  def format_time t 
    t.strftime('%a %e %l:%M %p') if t
  end

  def format_hours t
    t.round(4)
  end

  def week_range d
    "Week: #{d.cweek} | #{d.strftime('%b %e')} - #{(d + 6.days).strftime('%b %e')}"
  end
end
