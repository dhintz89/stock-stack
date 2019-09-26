class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @securities = current_user.securities.uniq
        render 'registrations/show'
    end

end