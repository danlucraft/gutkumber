
p :loaded_gutkumber

require 'gutkumber/formatter/gtk_formatter'
require 'gutkumber/formatter/gtk_progress_formatter'
require 'gutkumber/features_helper'

Dir[File.dirname(__FILE__) + "/gutkumber/steps/*_steps.rb"].each {|fn| require fn }
