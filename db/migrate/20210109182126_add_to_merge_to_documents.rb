class AddToMergeToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :extension, :string
  end
end
