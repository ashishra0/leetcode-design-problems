class InvestorA
  def update(stock_symbol, old_price, new_price)
    puts "[InvestorA] ALERT: #{stock_symbol} changed from #{old_price} → #{new_price}"
  end
end

class InvestorB
  def update(stock_symbol, old_price, new_price)
    puts "[InvestorB] ALERT: #{stock_symbol} changed from #{old_price} → #{new_price}"
  end
end

class Stock
  attr_accessor :symbol, :price, :threshold

  def initialize(symbol, price, threshold)
    @symbol = symbol
    @price = price
    @threshold = threshold
  end

  def significant_change?(new_price)
    return false if price.zero?

    change_ratio = ((new_price - price).abs / price.to_f) * 100
    change_ratio >= threshold
  end
end

class StockMarket
  def initialize
    @investors = []
    @stocks = {}
  end

  def add_investor(investor)
    @investors << investor
  end

  def remove_investor(investor)
    @investor.delete(investor)
  end

  def add_stock(stock)
    @stocks[stock.symbol] = stock
  end

  def set_stock_price(symbol, new_price)
    stock = @stocks[symbol]
    return unless stock

    old_price = stock.price

    if stock.significant_change?(new_price)
      stock.price = new_price
      notify_observers(stock.symbol, old_price, new_price)
    else
      stock.price = new_price
    end
  end

  def notify(symbol, old_price, new_price)
    @investors.each {|i| i.update(symbol, old_price, new_price) }
  end
end
