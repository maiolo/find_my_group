class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @group_members = @chatroom.group.group_members
    authorize @chatroom
  end
end
