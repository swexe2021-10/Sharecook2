class ApplicationController < ActionController::Base
    before_action :logged_in_user 
    def current_user
        if session[:login_uid]
             User.find_by(uid: session[:login_uid])
        end
    end
    helper_method :current_user
    def logged_in_user
        unless logged_in?
            flash[:denger] = "ログインしてください"
            redirect_to controller: :top, action: :login
        end
    end 
    def logged_in?
        !current_user.nil?
    end
end
