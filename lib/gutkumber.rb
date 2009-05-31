
$:.push(File.expand_path(File.dirname(__FILE__)))

$gutkumber = true

require 'rubygems'
require 'gtk2'
require 'spec/expectations'

require 'cucumber/formatter/progress'
require 'cucumber/formatter/pretty'

require 'gutkumber/formatter/gtk_formatter'
require 'gutkumber/formatter/gtk_progress_formatter'
require 'gutkumber/features_helper'
require 'gutkumber/gtk/dialog'
require 'gutkumber/finders'

Dir[File.dirname(__FILE__) + "/gutkumber/steps/*_steps.rb"].each {|fn| require fn }

module Gutkumber
  def self.in_test_process?
    true
  end
end

World(FeaturesHelper)
