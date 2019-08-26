class UsersPortfolio < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios, index: false do |t|
      t.belongs_to :users, index: true, foreign_key: true
      t.belongs_to :stocks, index: true, foreign_key: true
    end
  end
end
