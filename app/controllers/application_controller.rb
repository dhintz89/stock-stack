class ApplicationController < ActionController::Base
    include SessionsHelper

    # Salesforce = StockQuote::Stock.quote("CRM") will create an instance of a Stock and assign to "Salesforce"

    def welcome
    end
end
