class Folder < ApplicationRecord
  belongs_to :folder, optional: true
  has_many :folders
  has_many :documents

  def family
    ancestors + [self]
  end

  def ancestors
    folder ? (folder.ancestors + [folder]) : []
  end

  def fullpath
    "/#{family.map(&:name).join('/')}"
  end
  
  def to_param
    "#{id}-#{name}"
  end

end
