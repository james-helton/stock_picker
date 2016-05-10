def pick(stocks)
  best_buy = 0
  best_sell = 0
  best_profit = 0
  stocks.each_with_index do |buy_price, buy_day|
    stocks.slice(buy_day, stocks.length - buy_day).each_with_index do |sell_price, sell_day|
      if sell_price - buy_price > best_profit
        best_profit = sell_price - buy_price
        best_buy = buy_day
        best_sell = sell_day + buy_day
      end
    end
  end
  [best_buy, best_sell, best_profit]
end

stock_prices = []
puts "Enter each day's stock price.  Enter a blank line when done"
input = gets.chomp
until input == ''
  stock_prices.push(input.to_i)
  input = gets.chomp
end
best_transactions = pick(stock_prices)
puts "If you buy on day #{best_transactions[0]} and sell on day #{best_transactions[1]} you will make $#{best_transactions[2]}"
