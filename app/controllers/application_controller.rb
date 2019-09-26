class ApplicationController < ActionController::Base
    include SessionsHelper
    include ApplicationHelper

    def welcome
        if user_signed_in?
            render 'welcome'
        else
            render 'login_links'
        end
    end
end
