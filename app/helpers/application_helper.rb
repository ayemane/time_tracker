module ApplicationHelper

  def format_time t 
    t.strftime('%a %e %l:%M %p') if t
  end

  def format_hours t
    t.round(4)
  end
end
