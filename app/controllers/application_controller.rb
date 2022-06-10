class ApplicationController < ActionController::Base

    def current_user
        if session[:user_id]
            User.find_by id: session[:user_id]
        else
            false
        end
    end

    helper_method :current_user
    
    private
        def check_authenticity
            if !session[:user_id]
                redirect_to root_path
            end
        end

        def room_member?(room,user)
            room.users.pluck(:email).include?(user.email)
        end
end
