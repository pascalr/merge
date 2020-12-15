class Purchase < ApplicationRecord
  belongs_to :supplier
  belongs_to :part
  
  def unitary_price
    price / quantity
  end
end
