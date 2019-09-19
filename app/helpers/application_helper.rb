module ApplicationHelper

    def require_login
        unless logged_in?
            redirect_to signin_path, alert: "Must be signed in to access the requested page"
        end
    end
    
end
