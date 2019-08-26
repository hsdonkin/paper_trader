class CreateValues < ActiveRecord::Migration[5.2]
  def change
    create_table :values do |t|
      t.belongs_to :stock, index: true, foreign_key: true
      t.decimal :price, precision: 10, scale: 4
      t.datetime :log_time
      t.timestamps
    end
  end
end
