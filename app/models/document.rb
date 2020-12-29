class Document < ApplicationRecord
  belongs_to :folder, optional: true
  has_rich_text :content
end
