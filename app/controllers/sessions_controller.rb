class SessionsController < ApplicationController

    def new
    
    end
    
    def create 
        user = User.find_by(email: permit_params[:email])
        if user
            session[:user_id] = user.id
        else
            new_user = User.create(email: permit_params[:email])
            if new_user
                session[:user_id] = new_user.id
            end
        end
        redirect_to rooms_path
    end

    def destroy
        session[:user_id] = nil 
        redirect_to root_path
    end

    private 
        def permit_params
            params.permit(:email)
        end

end
