require 'refinerycms-base'

module Refinery
  module Newevents
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "newevents"
          plugin.activity = {
            :class => Newevent
          }
        end
      end
    end
  end
end
