import consumer from './consumer';

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create(
      { channel: 'ChatroomChannel', id: id },
      {
        received(data) {
          messagesContainer.insertAdjacentHTML('beforeend', data);
          document.getElementById("message_content").value = ''
        },
      }
    );
  }
};

function updateScroll(){
  var element = document.getElementById("messages");
  element.scrollTop = element.scrollHeight;
}

setInterval(updateScroll,1000);
export { initChatroomCable };
