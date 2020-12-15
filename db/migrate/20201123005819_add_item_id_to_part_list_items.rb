class AddItemIdToPartListItems < ActiveRecord::Migration[6.0]
  def change
    add_column :part_list_items, :item_id, :integer
  end
end
