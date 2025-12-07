require_relative 'observable'

class MarketEvents
  include Observable

  def publish(type:, user_id: nil, sku: nil)
    event = {
      type: type,
      user_id: user_id,
      sku: sku,
      timestamp: Time.now
    }

    notify_observers(event)
  end
end

class DiscountRule
  def update(event)
    return unless event[:type] == :cart_abandoned

    puts "Issues 10% coupon for user: #{event[:user_id]}"
  end
end

class UrgencyRule
  def update(event)
    return unless event[:type] == :inventory_low

    puts "Marked SKU #{event[:sku]} as low stock"
  end
end

class AnalyticsRule
  def update(event)
    puts "Analytics event received: #{event}"
  end
end
