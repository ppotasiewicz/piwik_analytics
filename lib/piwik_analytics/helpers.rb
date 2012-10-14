module PiwikAnalytics
  module Helpers
    def piwik_tracking_tag
      config = PiwikAnalytics.configuration
      return if config.disabled?

      locals = {:url => config.url, :id_site => config.id_site}

      if config.use_ecommerce?
        file = "piwik_analytics/piwik_tracking_tag_ecommerce"
        locals[:ecommerce_items] = @ecommerce_items || []
        locals[:ecommerce_order] = @ecommerce_order
      elsif config.use_async?
        file = "piwik_analytics/piwik_tracking_tag_async"
      else
        file = "piwik_analytics/piwik_tracking_tag"
      end
      render({
        :file => file,
        :locals => locals
      })
    end

  end
end
