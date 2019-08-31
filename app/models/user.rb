class User < ApplicationRecord
    has_many :watchlists
    has_many :securities, through: :watchlists
    
    validates :username, presence: true
    has_secure_password

end
