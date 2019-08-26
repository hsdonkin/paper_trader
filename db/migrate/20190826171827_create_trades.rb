class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :stock, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :buy_sell_price, precision: 10, scale: 4
      t.datetime :log_time
      t.timestamps
    end
  end
end
