class WatchlistsController < ApplicationController

    # include securities as child objects in index and/or show page  (index - watchlist_securities.each....)
    # include function to build new watchlist - enter name/desc - then enter company symbols


    def destroy
        @watchlist = Watchlist.find(params[:id])
        redirect_to securities_path
    end


end