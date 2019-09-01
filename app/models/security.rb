class Security < ApplicationRecord
    has_many :watchlists
    has_many :users, through: :watchlists

    validates :symbol, :company_name, presence: true

    def self.look_up_security(sec_hash)
        symbol = sec_hash[:symbol]
        company_name = sec_hash[:company_name]
        
        if !symbol.blank?
            security = Security.find_or_initialize_by(symbol: symbol)
            if !security
                security = Security.find_or_initialize_by(company_name: company_name)
                if !security
                    return "No securities match given symbol or company_name. Enter new symbol or company name."
                end
            end
            return security
        elsif !company_name.blank?
            security = Security.find_or_initialize_by(company_name: company_name)
            if !security
                return "No securities match given symbol or company_name. Enter new symbol or company name."
            end
            return security
        else
            return "Must enter a company symbol or name to search."
        end
    end


end
