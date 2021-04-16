class BidResponse < ApplicationRecord
  belongs_to :business
  belongs_to :bid

  has_one :experience
end
