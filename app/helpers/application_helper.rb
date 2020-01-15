module ApplicationHelper
    def flash_class(level)
        if level == 'success'
          'ui green message'
        elsif level == 'error'
          'ui red message'
        else
          'ui blue message'
        end
      end
end
