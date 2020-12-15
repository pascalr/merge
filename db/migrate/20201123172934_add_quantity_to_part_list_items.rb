class AddQuantityToPartListItems < ActiveRecord::Migration[6.0]
  def change
    add_column :part_list_items, :quantity, :float
  end
end
