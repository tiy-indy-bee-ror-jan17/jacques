class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :note

  def cost
    quantity * note.price
  end
end
