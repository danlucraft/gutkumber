
$gutkumber = true

require 'gtk2'

require 'gutkumber/formatter/gtk_formatter'
require 'gutkumber/formatter/gtk_progress_formatter'
require 'gutkumber/features_helper'
require 'gutkumber/gtk/dialog'

Dir[File.dirname(__FILE__) + "/gutkumber/steps/*_steps.rb"].each {|fn| require fn }

module Gutkumber
  def self.in_test_process?
    true
  end
end
