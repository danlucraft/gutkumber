# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gutkumber}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Lucraft"]
  s.date = %q{2010-02-19}
  s.description = %q{Gutkumber adds support to running cucumber tests for Ruby-Gnome 2 applications}
  s.email = %q{dan@fluentradical.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "gutkumber.gemspec",
     "lib/gutkumber.rb",
     "lib/gutkumber/features_helper.rb",
     "lib/gutkumber/finders.rb",
     "lib/gutkumber/formatter/gtk_formatter.rb",
     "lib/gutkumber/formatter/gtk_progress_formatter.rb",
     "lib/gutkumber/gtk/dialog.rb",
     "lib/gutkumber/steps/clicking_steps.rb",
     "lib/gutkumber/steps/common_steps.rb",
     "lib/gutkumber/steps/gtk_steps.rb",
     "lib/gutkumber/steps/keypress_steps.rb",
     "lib/gutkumber/steps/menu_steps.rb",
     "lib/gutkumber/steps/window_steps.rb"
  ]
  s.homepage = %q{http://github.com/danlucraft/gutkumber}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby-GNOME2 integration testing library}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

