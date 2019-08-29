class Value < ApplicationRecord
  belongs_to :stock

  def self.populate_value_table(symbol)
    stock = Stock.find_by_symbol(symbol)
    JSON.parse(Stock::Call.daily(symbol))["Time Series (15min)"].each do |t|
      if t[0].split[0].to_time > Date.today
        value = Value.new(:price => t[1]["4. close"], :log_time => t[0], :stock_id => stock.id)
        value.save!()
      end
    end
  end

  def self.populate_value_check(symbol)
    print "t.[1] entered into database"
    stock = Stock.find_by_symbol(symbol)
    if Value.find_by_stock_id(stock.id) != nil
      if stock.values.first.created_at < Time.now.utc - 500
        Value.where(stock_id: stock.id).destroy_all
        Value.populate_value_table(symbol)
      end
    else
      Value.populate_value_table(symbol)

    end
  end

end
