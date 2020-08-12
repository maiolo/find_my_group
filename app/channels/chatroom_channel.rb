class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_for Chatroom.find(params[:id])
  end
end
