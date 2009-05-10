Gutkumber
=========

by Daniel Lucraft (dan@fluentradical.com)


Description
-----------

A set Ruby-GNOME2 automation helpers. Comes with Cucumber
formatters and steps for writing features.

Features
--------

 * Interact with dialogs using Cucumber steps:

        When I click on "OK" in the "Save changes?" dialog
      
 * Make keypresses:

        When I press "Shift+K"
    
 * and mouse clicks:

        When I right click on ....

 * Type into TextEntrys or TextViews
 
        When I type "hello"
 

Usage
-----

Gutkumber requires that the Gtk main loop NOT be started, in order that it
can control the flow of events between steps. Therefore the code that starts the main
loop should be modified to look like this:

    unless $gutkumber
      Gtk.main_with_queue(100)
    end

Other than that, you can load your application normally, from your Cucumber env.rb file.


Writing a testable Ruby-GNOME2 application
------------------------------------------

In normal Gtk, Dialog#run *blocks*. This is no good for testing. To see why, imagine 
these (imaginary) steps:

    When I open the "Save" dialog
    And I fill in a filename of "Foo.rb"
    And I click on "Save"

Since the Dialog#run method blocks (makes your application do nothing until it receives
some input into the dialog), the second two steps will never be reached.

Therefore Gutkumber overrides Dialog#run to just show the Dialog, and not block. 

So if you use Dialog#run in your application, then the implication is that you MUST make 
sure that ALL effects from the Dialog are handled in response blocks. The following will 
not work anymore:
    
    response = dialog.run
    # ... do stuff based on response
    
Previously the other stuff would only be run after the dialog closed, but in the testing
environment, dialog.run will just show the dialog and return nil immediately. Change this code
to:

    dialog.run do |response|
      # ... do stuff based on response.
    end
    # absolutely nothing can go here.

This is not ideal. But I haven't been able to come up with any other way to make testing
dialogs possible.

License
-------

Gutkumber is copyright 2009 Daniel B. Lucraft and contributors. It is licensed under the GPL2.


