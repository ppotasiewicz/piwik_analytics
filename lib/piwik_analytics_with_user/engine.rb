# PiwikAnalytics
require 'active_support'

module PiwikAnalyticsWithUser

  class Piwik < Rails::Engine
    engine_name :piwik_analytics_with_user

    paths["app/views"]

    generators do
      load "generators/piwik_analytics_with_user.rb"
    end

    initializer "piwik_analytics.init", :before=> :load_config_initializers do
      require "piwik_analytics_with_user/helpers"
      load "piwik_analytics_with_user/init.rb"
    end
  end
end
