require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gutkumber"
    gem.summary = %Q{Ruby-GNOME2 integration testing library}
    gem.description = %Q{Gutkumber adds support to running cucumber tests for Ruby-Gnome 2 applications}
    gem.email = "dan@fluentradical.com"
    gem.homepage = "http://github.com/danlucraft/gutkumber"
    gem.authors = ["Daniel Lucraft"]
    gem.add_dependency(%q<rspec>, [">= 1.2.0"])
    gem.add_dependency(%q<cucumber>, [">= 0.3.0"])
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
