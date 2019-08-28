require 'byebug'
class Value < ApplicationRecord
  belongs_to :stock

  def self.populate_value_table(symbol)
    stock = Stock.find_by_symbol(symbol)
    if Value.find_by_stock_id(stock.id) != nil
       Value.where(stock_id: stock.id).destroy_all
    end
    JSON.parse(Stock::Call.daily(symbol))["Time Series (5min)"].each do |t|
      if t[0].split[0].to_time > Date.today
        value = Value.new(:price => t[1]["4. close"], :log_time => t[0], :stock_id => stock.id)
        value.save!()
      end
    end
  end

end
