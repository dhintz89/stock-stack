class SecuritiesController < ApplicationController

    def index
        @securities = current_user.securities.all
        # quotes = []
        # StockQuote::Stock.raw_quote("DIS","CRM").each do |symbol, val_hash|
        #     Security.new(val_hash) << quotes
        # end
        # @securities = quotes
    end

    def new
        @security = Security.new
    end

    def create
        @security
    end

    def show
        if params.include?(:security)
            @security = Security.look_up_security(security_params)
            if !@security.class.eql?(Security)
                redirect_to new_security_path, alert: @security
            else
                render action: :show
            end
        else
            @security = Security.find(params[:id])
        end
    end
                
        # @security = StockQuote::Stock.quote("DIS")

    private
    def security_params
        params.require(:security).permit(:symbol, :company_name, :primary_exchange, :calculation_price, :open, :close, :high, :low, :latest_price, :latest_source, :latest_update, :latest_volume, :previous_close, :change, :change_percent, :market_cap, :pe_ratio, :week52_high, :week52_low, :ytd_change)
    end
end