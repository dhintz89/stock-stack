class SecuritiesController < ApplicationController

    def index
        @securities = current_user.securities.uniq
    end

    def find
        @security = Security.new
    end

    def new
        if !params[:sec_id].nil? && !params[:sec_id].empty?
            @security = Security.find(params[:sec_id])
        else
            @security ||= Security.new(flash[:passed_sec])
        end
    end

    def create
        @security ||= Security.new(flash[:passed_sec])
        binding.pry
    end

    def update
        @security = Security.find(params[:id])
        binding.pry
    end

    def refresh
        @security = Security.find(params[:id])
        @security.refresh_security(StockQuote::Stock.raw_quote(@security.symbol)["#{@security.symbol}"]["quote"])
        if @security.valid?
            @security.save
            redirect_to security_path(@security), alert: "Security data has been updated successfully"
        else
            flash[:alert] = "Security Symbol not found - could not update"
            render 'securities/show'
        end
    end

    def destroy
        @security = Security.find(params[:id])
        @security.watchlists.where("user_id = ?", current_user.id).destroy_all
        redirect_to securities_path, alert: "Requested Security has been removed from all watchlists"
    end

    def show
        if params.include?(:security)
            @security = Security.look_up_security(security_params)
            if !@security.class.eql?(Security)
                redirect_to securities_find_path, alert: @security
            else
                flash[:passed_sec] = @security
                render action: :show
            end
        else
            @security = Security.find(params[:id])
        end
    end

    private
    def security_params
        params.require(:security).permit(:watchlist_ids[], :symbol, :companyName, :primaryExchange, :calculationPrice, :open, :close, :high, :low, :latestPrice, :latestSource, :latestUpdate, :latestVolume, :previousClose, :change, :changePercent, :marketCap, :peRatio, :week52High, :week52Low, :ytdChange)
    end
end