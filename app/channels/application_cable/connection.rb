module ApplicationCable
  class Connection < ActionCable::Connection::Base

    def connect
      puts "------------------------"
      puts request.session[:user_id]
    end

  end
end
