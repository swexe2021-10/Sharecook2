class User < ApplicationRecord
    has_many :reviews
    validates :uid, uniqueness: true
end
