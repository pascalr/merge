class AddQuantityToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :quantity, :float
  end
end
