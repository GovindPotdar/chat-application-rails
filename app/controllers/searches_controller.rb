class SearchesController < ApplicationController

    def index
        @searches = User.where("email LIKE '%#{params[:search]}%'")
    end

end
