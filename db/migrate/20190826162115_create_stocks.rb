class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name

      t.boolean :gain, default: true
      t.decimal :current_price, precision: 10, scale: 4

      t.decimal :daily_open, precision: 10, scale: 4
      t.decimal :daily_close, precision: 10, scale: 4

      t.decimal :weekly_open, precision: 10, scale: 4
      t.decimal :weekly_close, precision: 10, scale: 4

      t.decimal :monthly_open, precision: 10, scale: 4
      t.decimal :monthly_close, precision: 10, scale: 4

      t.decimal :daily_high, precision: 10, scale: 4
      t.decimal :daily_low, precision: 10, scale: 4

      t.decimal :weekly_high, precision: 10, scale: 4
      t.decimal :weekly_low, precision: 10, scale: 4

      t.decimal :monthly_high, precision: 10, scale: 4
      t.decimal :monthly_low, precision: 10, scale: 4

      t.decimal :yearly_high, precision: 10, scale: 4
      t.decimal :yearly_low, precision: 10, scale: 4

      t.bigint :volume

    end
  end
end
