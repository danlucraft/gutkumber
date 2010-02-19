
module Gutkumber
  TICK_SIZE = ENV["GUTKUMBER_TICK_SIZE"] || 0.3
  
  def self.find_gtk_window(title)
    Gtk::Window.toplevels.detect do |window| 
      if title.is_a?(Regexp)
        window.title =~ title
      else
        window.title =~ Regexp.new(Regexp.escape(title))
      end
    end
  end
  
  def self.dialogs
    Gtk::Window.toplevels.select do |window|
      window.class.ancestors.include?(Gtk::Dialog)
    end
  end
  
  def self.find_all_gtk_windows
    Gtk::Window.toplevels
  end
  
  def self.window_buttons(window)
    buttons = window.child_widgets_with_class(Gtk::Button)
    buttons.map {|button| button.child_widgets_with_class(Gtk::Label).map{|la| la.text}.join(" ") }
  end
  
  def self.label_texts(widget)
    widget.child_widgets_with_class(Gtk::Label).map do |label|
      label.text
    end
  end
  
  def self.find_button(window, button_label)
    buttons = window.child_widgets_with_class(Gtk::Button)
    buttons.each do |button|
      label = button.child_widgets_with_class(Gtk::Label).map{|la| la.text}.join(" ")
      return button if label =~ Regexp.new(Regexp.escape(button_label))
    end
    nil
  end
  
  def self.tick
    Gtk.main_iteration while Gtk.events_pending?
  end
  
  def self.wait_tick
    tick
    sleep TICK_SIZE
  end
end

class Gtk::Widget

  def child_widgets_with_class(klass, acc=[])
    if self.is_a? klass
      acc << self
    end
    if self.respond_to?(:children)
      self.children.each do |gtk_child|
        gtk_child.child_widgets_with_class(klass, acc)
      end
    end
    acc
  end
end