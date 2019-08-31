class SecuritiesController < ApplicationController

    def index
        # quotes = []
        # StockQuote::Stock.raw_quote("DIS","CRM").each do |symbol, val_hash|
        #     Security.new(val_hash) << quotes
        # end
        # @securities = quotes
    end

    def show
        @security = StockQuote::Stock.quote("DIS")
    end

    private
    def security_params
        params.require(:security).permit(:symbol, :company_name, :primary_exchange, :calculation_price, :open, :close, :high, :low, :latest_price, :latest_source, :latest_update, :latest_volume, :previous_close, :change, :change_percent, :market_cap, :pe_ratio, :week52_high, :week52_low, :ytd_change)
    end
end