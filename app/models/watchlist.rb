class Watchlist < ApplicationRecord
    belongs_to :user
    belongs_to :security

    # def roll_up
    #     Watchlist.where("name = ? AND user_id = ?", self.name, self.user_id)
    # end

    def self.roll_up(wl)
        Watchlist.where("name = ? AND user_id = ?", wl.name, wl.user_id)
    end

    # def roll_up_secs
    #     roll_up.map {|wl| wl.security}
    # end

    def self.roll_up_secs(wl)
        roll_up(wl).map {|wl| wl.security}
    end

    def self.full_sec_list(wl, att)
        roll_up_secs(wl).map {|sec| sec.send(att)}
    end

    def self.total_up(wl, att)
        total = 0
        roll_up_secs(wl).each {|sec| total += sec.send(att)}
        total
    end

    # def total_current_value
    #     total = 0
    #     roll_up_secs.each {|sec| total += sec.latestPrice}
    #     total
    # end

    def self.total_change(wl)
        # this is not adding up to the correct number for some reason, multiplying by factor of 10
        change = total_up(wl, 'change') / total_up(wl, 'previousClose') * 100
    end

end
