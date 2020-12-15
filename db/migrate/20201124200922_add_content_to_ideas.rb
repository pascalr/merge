class AddContentToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :content, :text
  end
end
