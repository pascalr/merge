class DocumentValidator < ActiveModel::Validator
  def validate(record)
    if record.raw_content and (record.content and record.content.body and not record.content.body.empty?)
      record.errors.add :base, "Can't have a document with both content and raw content."
    end
  end
end

class Document < ApplicationRecord
  belongs_to :folder, optional: true
  has_rich_text :content
  validates_with DocumentValidator

  def ancestors
    folder ? ([folder] + folder.ancestors) : []
  end

  def to_param
    "#{id}-#{name}"
  end
end
