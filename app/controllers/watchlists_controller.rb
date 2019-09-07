class WatchlistsController < ApplicationController

    # include securities as child objects in index and/or show page  (index - watchlist_securities.each....)
    # include function to build new watchlist - enter name/desc - then enter company symbols

    # refresh watchlist -> watchlist_securities.each update(...)
    # flow: user views a security -> @security = security.new(...)       user then adds to a watchlist -> @security.watchlist = ... | @security.save

    def new
        
    end

    def destroy
        @watchlist = Watchlist.find(params[:id])
        redirect_to securities_path
    end


end