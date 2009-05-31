
Then /^I should see a window titled #{FeaturesHelper::STRING_RE}$/ do |string|
  Gutkumber.find_gtk_window(parse_string(string)).should_not be_nil
end

Then /^I should see a window with title like #{FeaturesHelper::STRING_RE}$/ do |string|
  Gutkumber.find_gtk_window(Regexp.new(parse_string(string))).should_not be_nil
end
