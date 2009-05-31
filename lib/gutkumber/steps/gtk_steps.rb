
When /I click the button #{FeaturesHelper::STRING_RE} in the dialog #{FeaturesHelper::STRING_RE}/ do |button, dialog|
  button, dialog = parse_string(button), parse_string(dialog)
  dialog = Gutkumber.find_gtk_window(dialog)
  button = Gutkumber.find_button(dialog, button)
 
  dialog.response(dialog.get_response(button))
  # sadly necessary for some reason. Please tell me why!
  Gutkumber.wait_tick
end

When /^I save as #{FeaturesHelper::STRING_RE}$/ do |filename|
  filename = parse_string(filename)
  dialog = Gutkumber.find_gtk_window("Save As")
end

When /^I set the #{FeaturesHelper::STRING_RE} dialog's filename to #{FeaturesHelper::STRING_RE}$/ do |dialog_name, filename|
  dialog_name, filename = parse_string(dialog_name), parse_string(filename)
  dialog = Gutkumber.find_gtk_window(dialog_name)
  if dialog_name == "Open"
    dialog.filename = filename
  else
    table = dialog.child_widgets_with_class(Gtk::Table).first
    mystery_gtk = table.children[2]
    dialog.filename = filename
    mystery_gtk.text = filename.split("/").last
  end
end

Then /I should see a dialog "([^"]+)" with buttons "([^"]+)"/ do |title, button_names| # "
  dialog = Gutkumber.find_gtk_window(title)
  raise "couldn't find dialog #{title.inspect}" unless dialog
  buttons = Gutkumber.window_buttons(dialog)
  button_names.split(",").map(&:strip).each do |name|
    buttons.should include(name)
  end
end

Then /I should see #{FeaturesHelper::STRING_RE} in a dialog/ do |text|
  labels = Gutkumber.dialogs.map {|dialog| Gutkumber.label_texts(dialog) }
  labels.any?{|label| label.any?{|l| l.include? text}}.should be_true
end

Then /there should be no dialog called "([^"]+)"/ do |title|
  Gutkumber.find_gtk_window(title).should be_nil
end

