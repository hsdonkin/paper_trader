require 'byebug'
class Value < ApplicationRecord
  belongs_to :stock

  def self.populate_value_table(symbol)
    stock = Stock.find_by_symbol(symbol)
    JSON.parse(Stock::Call.daily(symbol))["Time Series (5min)"].each do |t|
      value = Value.new(:price => t[1]["4. close"], :log_time => t[0], :stock_id => stock.id)
      value.save!()
    end
  end

end
