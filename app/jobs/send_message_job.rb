class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message,chatroom)
    # Do something later
    sender = ApplicationController.render(
      partial: "messages/sender", 
      locals: { message: message }
    )

    receiver = ApplicationController.render(
      partial: "messages/receiver", 
      locals: { message: message }
    )

    ChatroomChannel.broadcast_to(
      chatroom,
      sender: sender,
      receiver: receiver,
      message: message
    )

      # ChatroomChannel.broadcast_to(
      #   chatroom,
      #   ApplicationController.render(partial: "messages/message", locals: { message: message })
      # )
  end
end
