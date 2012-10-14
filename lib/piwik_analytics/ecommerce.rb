module PiwikAnalytics
  class EcommerceItem
    def initialize(sku, name = "", categories=[], price = 0.0, quantity = 1)
      categories = [categories] if categories.class == String
      @sku, @name, @categories, @price, @quantity = sku, name, categories, price, quantity
    end

    # Returns a string used in template as parameters for the addEcommerceItem() call.
    def as_js_params
      categories = @categories.map{|c| "\"#{c}\""}.join(", ")
      js_params = [@sku, @name, categories, @price, @quantity].map do |parameter|
        "\"#{parameter.json_escape}\""
      end.join(", ")

      js_params
    end

  end

  # An order in Piwik, is a finalized, payed order.
  class EcommerceOrder
    # Specifiy the order details to Piwik server & sends the data to Piwik server
    # "A10000123", // (required) Unique Order ID
    # 35, // (required) Order Revenue grand total (includes tax, shipping, and subtracted discount)
    # 30, // (optional) Order sub total (excludes shipping)
    # 5.5, // (optional) Tax amount
    # 4.5, // (optional) Shipping amount
    # false // (optional) Discount offered (set to false for unspecified parameter)
    def initialize(order_id, grand_total, sub_total = 0.0, tax = 0.0, shipping = 0.0, discount = false)
      @order_id, @grand_total, @sub_total, @tax, @shipping, @discount = order_id, grand_total, sub_total, tax, shipping, discount
    end
    def as_js_params
      js_params = [@order_id, @grand_total, @sub_total, @tax, @shipping, @discount].map do |parameter|
        "\"#{parameter.json_escape}\""
      end.join(", ")

      js_params
    end
  end
end
