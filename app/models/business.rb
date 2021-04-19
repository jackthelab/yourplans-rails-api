class Business < ApplicationRecord
    has_secure_password

    validates :name, :street_address, :city, :state, :phone, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { in: 10..30, wrong_length: "Your password must be within 10 and 30 characters" }

    has_many :bid_responses
    has_many :experiences, through: :bid_responses
    has_many :reviews, through: :experiences

    def state_bids
        state = self.state

        Bid.all.select { |bid| bid.state == state }
    end

    def city_bids
        city = self.city
        state = self.state

        Bid.all.select { |bid| bid.state === state && bid.city = city }
    end

end
