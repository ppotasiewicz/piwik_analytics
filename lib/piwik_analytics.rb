["configuration", "piwik_tracker"].each do |lib|
  require File.join(File.dirname(__FILE__), 'piwik_analytics', lib)
end

module PiwikAnalytics
  require 'piwik_analytics/engine' if defined?(Rails)

  class <<self
    attr_writer :configuration, :tracker

    def configuration
      @configuration ||= PiwikAnalytics::Configuration.new
    end

    def piwik_tracker
      @tracker ||= PiwikAnalytics::PiwikTracker.new
    end
  end
end
