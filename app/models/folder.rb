class Folder < ApplicationRecord
  belongs_to :folder, optional: true
end
