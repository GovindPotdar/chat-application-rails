class MessagesController < ApplicationController

    before_action :check_authenticity

    def create
        if !permit_params[:message].empty?
            room = Room.find_by(room_number: permit_params[:room_number])
            if room
                if room_member? room, current_user
                    message = Message.new(user:current_user,room:room,data:permit_params[:message],message_type:0)
                    if message.save
                        data = {
                            message: permit_params[:message],
                            user: current_user.email
                        }
                        ActionCable.server.broadcast "chat_channel_#{room.room_number}",data
                    end
                end
            end
        end
    end


    private
        def permit_params
            params.permit(:message,:room_number)
        end

        

end
