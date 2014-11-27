require File.join(File.dirname(__FILE__), 'piwik_analytics_with_user', 'configuration')

module PiwikAnalyticsWithUser
  require 'piwik_analytics_with_user/engine' if defined?(Rails)

  class <<self
    attr_writer :configuration

    def configuration
      @configuration ||= PiwikAnalyticsWithUser::Configuration.new
    end
  end
end
