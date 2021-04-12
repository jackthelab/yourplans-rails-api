class User < ApplicationRecord
    has_secure_password

    validates :first_name, :last_name, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { in: 10..30, wrong_length: "Your password must be within 10 and 30 characters" }

    has_many :bids
    has_many :experiences, through: :bids
    has_many :reviews
end
