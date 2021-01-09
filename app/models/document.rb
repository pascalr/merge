class Document < ApplicationRecord
  belongs_to :folder, optional: true
  has_rich_text :content

  def get_content
    content.body._dump
  end
  
  def to_param
    "#{id}-#{name}"
  end
end
