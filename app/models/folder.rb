class Folder < ApplicationRecord
  belongs_to :folder, optional: true
  has_many :folders
  has_many :documents
end
