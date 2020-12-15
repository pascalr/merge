class AddDayToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :day, :date
  end
end
