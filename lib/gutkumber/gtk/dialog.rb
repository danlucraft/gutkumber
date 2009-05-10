
module Gtk
  class Dialog
    alias :old_run :run
    
    class << self
      def _cucumber_running_dialogs
        @_cucumber_running_dialogs ||= []
      end
    end
    
    def run(*args, &block)
      if $gutkumber
        show_all
        Dialog._cucumber_running_dialogs << self
        signal_connect('response') do |_, response|
          block.call(response)
          Dialog._cucumber_running_dialogs.delete(self)
        end
      else
        old_run(*args, &block)
      end
    end
  end
end
