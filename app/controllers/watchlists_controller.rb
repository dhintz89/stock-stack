class WatchlistsController < ApplicationController

    # include securities as child objects in index and/or show page  (index - watchlist_securities.each....)

    # refresh watchlist -> watchlist_securities.each update(...)
    # flow: user views a security -> @security = security.new(...)       user then adds to a watchlist -> @security.watchlist = ... | @security.save

    def index
        wl = current_user.watchlists.select(:name).distinct
        @watchlists = wl.map {|wlname| Watchlist.find_by(name: wlname.name) }
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
            mod_watchlist = Watchlist.find_by(name: watchlist_params[:name], user_id: current_user.id)
            if mod_watchlist
                @watchlist = Watchlist.create(name: mod_watchlist.name, description: mod_watchlist.description, security_id: watchlist_params[:security_id], user_id: current_user.id)
                redirect_to security_path(@watchlist.security_id), alert: "Security added to Watchlist"
            else
                @watchlist = Watchlist.create(name: watchlist_params[:name], description: watchlist_params[:description], security_id: watchlist_params[:security_id], user_id: current_user.id)
                redirect_to security_path(@watchlist.security_id), alert: "Watchlist created and Security added"
            end
        end
    end

    def edit
        @watchlist = Watchlist.find(params[:id])
    end

    def update
        @watchlist = Watchlist.find(params[:id])
        Watchlist.roll_up(@watchlist).each do |wl|
            wl.update(watchlist_params)
        end
        redirect_to watchlist_path(@watchlist)
    end

    def show
        @watchlist = Watchlist.find(params[:id])
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