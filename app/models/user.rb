class User < ApplicationRecord
    has_many :watchlists
    has_many :securities, through: :watchlists
    validates :name, presence: true
    
    # can't use password validation and Oauth without custom coding - add in future release
    # validates :username, presence: true
    # has_secure_password

end
