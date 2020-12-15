class CreatePartListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :part_list_items do |t|

      t.timestamps
    end
  end
end
