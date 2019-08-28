class AddSharesToPortfolio < ActiveRecord::Migration[5.2]
  def change
    change_table :portfolios do |t|
      t.integer :shares
    end
  end
end
