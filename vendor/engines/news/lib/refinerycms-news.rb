require 'refinerycms-base'

module Refinery
  module News
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "news"
          plugin.activity = {
            :class => New
          }
        end
      end
    end
  end
end
