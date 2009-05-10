
def make_event_button(window, x, y, button, type)
  case type
  when :press
    event_button = Gdk::EventButton.new(Gdk::Event::BUTTON_PRESS)
  when :press2
    event_button = Gdk::EventButton.new(Gdk::Event::BUTTON2_PRESS)
  when :press3
    event_button = Gdk::EventButton.new(Gdk::Event::BUTTON3_PRESS)
  when :release
    event_button = Gdk::EventButton.new(Gdk::Event::BUTTON_RELEASE)
  end
  event_button.x = x
  event_button.y = y
  event_button.button = button
  event_button.time = Gdk::Event::CURRENT_TIME
  event_button.window = window
  event_button
end

def right_click_on(widget)
  make_event_button(widget.window, 0, 0, 3, :press).put
  make_event_button(widget.window, 0, 0, 3, :release).put
end

def left_click_on(widget)
  allocation = widget.allocation
  x = allocation.x + allocation.width/2
  y = allocation.y + allocation.height/2
  make_event_button(widget.window, x, y, 1, :press).put
  make_event_button(widget.window, x, y, 1, :release).put
end
