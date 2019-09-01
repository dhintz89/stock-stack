class Watchlist < ApplicationRecord
    belongs_to :user
    belongs_to :security

    def total_value

    end

    def total_change

    end

end
