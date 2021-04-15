class Experience < ApplicationRecord
  belongs_to :bid
  belongs_to :bid_response

  has_one :review
end
