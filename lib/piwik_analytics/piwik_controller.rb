module PiwikAnalytics
  module PiwikController
    def piwik_analytics_add_ecommerce_item(sku, name = "", categories=[], price = 0.0, quantity = 1)
      @ecommerce_items ||= []
      @ecommerce_items << PiwikAnalytics::EcommerceItem.new(sku, name, categories, price, quantity)
    end

    def piwik_analytics_set_ecommerce_order(order_id, grand_total, sub_total = 0.0, tax = 0.0, shipping = 0.0, discount = false)
      @ecommerce_order = PiwikAnalytics::EcommerceOrder.new(order_id, grand_total, sub_total, tax, shipping, discount)
    end
  end
end
