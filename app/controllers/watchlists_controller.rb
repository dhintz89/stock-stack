class WatchlistsController < ApplicationController

    # include securities as child objects in index and/or show page  (index - watchlist_securities.each....)
    # include function to build new watchlist - enter name/desc - then enter company symbols

    # refresh watchlist -> watchlist_securities.each update(...)
    # flow: user views a security -> @security = security.new(...)       user then adds to a watchlist -> @security.watchlist = ... | @security.save

    def index
        @watchlists = current_user.watchlists.all
    end

    def new
        @watchlist = Watchlist.new
        @sec_id = params[:sec_id]
    end

    def create
        @watchlist = Watchlist.find_by(name: watchlist_params[:name], security_id: watchlist_params[:security_id], user_id: current_user.id)
        if @watchlist
            redirect_to security_path(@watchlist.security_id), alert: "Security already associated with Watchlist"
        else
            @watchlist = Watchlist.create(name: watchlist_params[:name], security_id: watchlist_params[:security_id], user_id: current_user.id)
            redirect_to security_path(@watchlist.security_id), alert: "Security added to Watchlist"
        end
    end

    def show
        
    end

    def destroy
        @watchlist = Watchlist.find(params[:id])
        redirect_to securities_path
    end

    private
    def watchlist_params
        params.require(:watchlist).permit(:name, :description, :security_id)
    end

end