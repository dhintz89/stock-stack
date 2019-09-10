class SecuritiesController < ApplicationController

    def index
        @securities = Security.all.limit(10)
    end

    def new
        @security = Security.new
    end

    def create
        @security = Security.look_up_security(security_params)
        if !@security.class.eql?(Security)
            redirect_to new_security_path, alert: @security
        else
            redirect_to security_path(@security)
        end
    end

    def update
        @security = Security.find(params[:id])
    end

    def refresh
        @security = Security.find(params[:id])
        begin 
            data = StockQuote::Stock.raw_quote(@security.symbol)["#{@security.symbol}"]["quote"]
            @security.refresh_security(data)
            if @security.valid?
                @security.save
                redirect_to security_path(@security), message: "Security data has been updated successfully"
            else
                flash[:message] = "Refresh Unsuccessful: Security data located, but not valid."
                render 'securities/show'
            end
        rescue RuntimeError => e
            flash[:message] = "Security Symbol not found - could not update"
            redirect_to security_path(@security)
        end
    end

    def destroy
        @security = Security.find(params[:id])
        @security.watchlists.where("user_id = ?", current_user.id).destroy_all
        redirect_to securities_path, alert: "Requested Security has been removed from all watchlists"
    end

    def show
        @security = Security.find(params[:id])
    end

    private
    def security_params
        params.require(:security).permit(:symbol, :companyName, :primaryExchange, :calculationPrice, :open, :close, :high, :low, :latestPrice, :latestSource, :latestUpdate, :latestVolume, :previousClose, :change, :changePercent, :marketCap, :peRatio, :week52High, :week52Low, :ytdChange, watchlist_ids: [], watchlists_attributes: [:name, :description])
    end
end