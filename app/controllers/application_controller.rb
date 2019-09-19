class ApplicationController < ActionController::Base
    include SessionsHelper
    include ApplicationHelper

    def welcome
        if logged_in?
            render 'welcome'
        else
            render 'login_links'
        end
    end
end
