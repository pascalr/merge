class AddPartToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchases, :part, null: false, foreign_key: true
  end
end
