class ChatChannel < ApplicationCable::Channel
  def subscribed
    # p current_user
    stream_from "chat_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
