class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    endchatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end
end
