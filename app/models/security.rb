class Security < ApplicationRecord
    has_many :watchlists
    has_many :users, through: :watchlists
    
    validates :symbol, :company_name, presence: true
end
