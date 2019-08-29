class User < ApplicationRecord
    validate :username, presence: true
    has_secure_password
end
