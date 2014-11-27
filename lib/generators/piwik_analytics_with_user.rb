module PiwikAnalyticsWithUser
  module Generators
    class Base < Rails::Generators::NamedBase
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'piwik_analytics_with_user', generator_name, 'templates'))
    end
  end
end
