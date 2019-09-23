class User < ApplicationRecord
    has_many :watchlists
    has_many :securities, through: :watchlists
    
    # can't use password validation and Oauth - add in future release
    # validates :username, presence: true
    # has_secure_password

end
