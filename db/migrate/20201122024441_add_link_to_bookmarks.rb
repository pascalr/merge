class AddLinkToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_column :bookmarks, :link, :string
  end
end
