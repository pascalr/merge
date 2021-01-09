class AddToMergeToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :extension, :string
    add_column :documents, :body, :text
  end
end
