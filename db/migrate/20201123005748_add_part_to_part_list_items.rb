class AddPartToPartListItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :part_list_items, :part, null: false, foreign_key: true
  end
end
