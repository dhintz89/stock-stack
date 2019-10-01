class Security < ApplicationRecord
    has_many :watchlists
    has_many :users, through: :watchlists

    validates :symbol, :companyName, presence: true
    before_validation :symbol_upcase
    before_validation :convert_decimals
    
    scope :best_performing, -> { order(changePercent: :desc).limit(5) }

    def self.look_up_security(sec_hash)
        symbol = sec_hash[:symbol].upcase
        company_name = sec_hash[:companyName]
        security_field_ary = Security.new.attributes.keys
        
        if !symbol.blank?
            security = Security.find_by(symbol: symbol)
            if !security
                security = Security.find_by(companyName: company_name)
                if !security
                    begin
                        data = StockQuote::Stock.raw_quote(symbol)["#{symbol}"]["quote"].select {|k,v| security_field_ary.include?(k)}
                        security = Security.new(data)
                    rescue
                        return "No securities match given symbol or company_name. Enter new symbol or company name."
                    end
                end
            end
            if security.valid?
                security.save
                return security
            else
                return "Data returned from source was not a valid Security (must have a Symbol and a Company Name). Go to https://iextrading.com/apps/stocks/#{symbol} to view on IEX Site."
            end
        elsif !company_name.blank?
            security = Security.find_by(companyName: company_name)
            # IEX API doesn't allow searching by company_name - add this in future release
            # if !security
            #     begin
            #           data = StockQuote::Stock.raw_quote(company_name)["#{company_name}"]["quote"]
            #           security = Security.new(data)
            #     rescue
                if !security
                    return "No securities match given symbol or company_name. Enter new symbol or company name."
                end
            # end
            if security.valid?
                security.save
                return security
            else
                return "Data returned from source was not a valid Security (must have a Symbol and a Company Name). Go to https://iextrading.com/apps/stocks/#{symbol} to view on IEX Site."
            end
        else
            return "Must enter a company symbol or name to search."
        end
    end

    def refresh_security(sec_hash)
        self.symbol = sec_hash["symbol"]
        self.companyName = sec_hash["companyName"]
        self.primaryExchange = sec_hash["primaryExchange"]
        self.calculationPrice = sec_hash["calculationPrice"]
        self.open = sec_hash["open"].to_f
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

    def convert_decimals
        self.open = "%.2f" % self.open.to_f
        self.close = "%.2f" % self.close.to_f
        self.high = "%.2f" % self.high.to_f
        self.low = "%.2f" % self.low.to_f
        self.latestPrice = "%.2f" % self.latestPrice.to_f
        self.previousClose = "%.2f" % self.previousClose.to_f
        self.change = "%.2f" % self.change.to_f
        self.changePercent = self.changePercent.to_f.round(3)
        self.week52High = "%.2f" % self.week52High.to_f
        self.week52Low = "%.2f" % self.week52Low.to_f
        self.ytdChange = "%.2f" % self.ytdChange.to_f
    end

end
