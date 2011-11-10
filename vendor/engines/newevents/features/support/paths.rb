module NavigationHelpers
  module Refinery
    module Newevents
      def path_to(page_name)
        case page_name
        when /the list of newevents/
          admin_newevents_path

         when /the new newevent form/
          new_admin_newevent_path
        else
          nil
        end
      end
    end
  end
end
