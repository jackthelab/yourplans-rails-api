class Bid < ApplicationRecord
  belongs_to :user

  has_one :experience
  has_one :review, through: :experience
  has_many :bid_responses

end
