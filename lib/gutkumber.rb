
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
  
  def self.begin_tests
    @ready_to_test = true
  end
  
  def self.ready_to_test?
    @ready_to_test
  end
  
  def self.start_application_thread(&block)
    Thread.new do
      block.call
    end
    
    loop do
      sleep 0.1
      break if Gutkumber.ready_to_test?
    end
  end
end
