module PiwikAnalyticsWithUser
  module Helpers
    def piwik_tracking_tag(id_user = nil)
      config = PiwikAnalyticsWithUser.configuration
      return if config.disabled?

      if config.use_async?
        file = "piwik_analytics_with_user/piwik_tracking_tag_async"
      else
        file = "piwik_analytics_with_user/piwik_tracking_tag"
      end
      render({
        :file => file,
        :locals => {:url => config.url, :id_site => config.id_site, :id_user => id_user}
      })
    end
  end
end
