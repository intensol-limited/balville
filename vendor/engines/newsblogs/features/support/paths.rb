module NavigationHelpers
  module Refinery
    module Newsblogs
      def path_to(page_name)
        case page_name
        when /the list of newsblogs/
          admin_newsblogs_path

         when /the new newsblog form/
          new_admin_newsblog_path
        else
          nil
        end
      end
    end
  end
end
