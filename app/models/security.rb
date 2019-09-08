class Security < ApplicationRecord
    has_many :watchlists
    has_many :users, through: :watchlists

    # validates :symbol, :companyName, presence: true
    before_validation :symbol_upcase

    def self.look_up_security(sec_hash)
        symbol = sec_hash[:symbol]
        company_name = sec_hash[:companyName]
        
        if !symbol.blank?
            security = Security.find_or_create_by(symbol: symbol)
            if !security
                security = Security.find_or_create_by(companyName: company_name)
                if !security
                    return "No securities match given symbol or company_name. Enter new symbol or company name."
                end
            end
            return security
        elsif !company_name.blank?
            security = Security.find_or_create_by(companyName: company_name)
            if !security
                return "No securities match given symbol or company_name. Enter new symbol or company name."
            end
            return security
        else
            return "Must enter a company symbol or name to search."
        end
    end

    # def watchlists_attributes=(watchlists_attributes)
    #     watchlists_attributes.each do |WLAttSet|
    #         Watchlist.find_or_create_by(WLAttSet)
    # end

    def refresh_security(sec_hash)
        self.symbol = sec_hash["symbol"]
        self.companyName = sec_hash["companyName"]
        self.primaryExchange = sec_hash["primaryExchange"]
        self.calculationPrice = sec_hash["calculationPrice"]
        self.open = sec_hash["open"]
        self.close = sec_hash["close"]
        self.high = sec_hash["high"]
        self.low = sec_hash["low"]
        self.latestPrice = sec_hash["latestPrice"]
        self.latestSource = sec_hash["latestSource"]
        self.latestUpdate = sec_hash["latestUpdate"]
        self.latestVolume = sec_hash["latestVolume"]
        self.previousClose = sec_hash["previousClose"]
        self.change = sec_hash["change"]
        self.changePercent = sec_hash["changePercent"]
        self.market_cap = sec_hash["market_cap"]
        self.peRatio = sec_hash["peRatio"]
        self.week52High = sec_hash["week52High"]
        self.week52Low = sec_hash["week52Low"]
        self.ytdChange = sec_hash["ytdChange"]
    end

    def symbol_upcase
        self.symbol.upcase
    end


end
