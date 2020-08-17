class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        if logged_in?
            return User.find(session[:user_id])
        else
            nil
        end
    end
end
