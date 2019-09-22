class Watchlist < ApplicationRecord
    belongs_to :user
    belongs_to :security
    scope :rolled_up, ->(wl) { where("name = ? AND user_id = ?", wl.name, wl.user_id)}

    # def self.roll_up(wl)
    #     Watchlist.where("name = ? AND user_id = ?", wl.name, wl.user_id)
    # end

    def self.roll_up_secs(wl)
        rolled_up(wl).map {|wl| wl.security}
    end

    def self.full_sec_attributes(wl, att)
        roll_up_secs(wl).map {|sec| sec.send(att)}
    end

    def self.total_up(wl, att)
        total = 0
        roll_up_secs(wl).each {|sec| total += sec.send(att).to_f}
        total
    end

    def self.total_change(wl)
        change = total_up(wl, 'change') / total_up(wl, 'previousClose') * 100
        change.to_f.round(3)
    end

end
