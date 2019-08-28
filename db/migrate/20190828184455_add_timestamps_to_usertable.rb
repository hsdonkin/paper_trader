class AddTimestampsToUsertable < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :created_at, :datetime, null: false
    add_column :stocks, :updated_at, :datetime, null: false
  end
end
