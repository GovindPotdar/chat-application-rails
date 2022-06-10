require 'securerandom'

class RoomsController < ApplicationController

    before_action :check_authenticity

    def index
        @rooms = current_user.rooms.group(:id)
    end

    def show
        @room = Room.find_by(room_number: params[:id])
        if @room && room_member?(@room,current_user)
            @messages = @room.messages.last(15)
        else
            redirect_to root_path
        end
    end

    def create_personal
        person = User.where(email: params[:person_email])
        if person
            room = Room.create(room_number:SecureRandom.uuid,room_type: 0)
            room.room_users.create([{user: current_user},{user: person[0]}])
        end 
        redirect_to rooms_path
    end

    def create_group
        room = Room.create(room_number:SecureRandom.uuid,room_type: 1)
        room.room_users.create({user: current_user})
        redirect_to room_path(room.room_number)
    end

    def join_group
        room = Room.find_by(room_number: params[:room_id])
        if room && room.many_to_many? && !room_member?(room,current_user)
            room.room_users.create({user: current_user})
            redirect_to room_path(room.room_number) and return 
        end
        redirect_to rooms_path
    end

end
