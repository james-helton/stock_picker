def pick(stocks)
  best_buy = 0
  best_sell = 0
  best_profit = 0
  stocks.each do |day|
    buy_day = stocks.index(day)
    rest = stocks.slice(buy_day, stocks.length - buy_day)
    if rest.max - day > best_profit
      best_profit = rest.max - day
      best_buy = buy_day
      best_sell = rest.index(rest.max) + buy_day
    end
  end
  [best_buy, best_sell]
end
