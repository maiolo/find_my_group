import consumer from './consumer';

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {

    function updateScroll(){
      var element = document.getElementById("messages");
      element.scrollTop = element.scrollHeight;
    }
    const id = messagesContainer.dataset.chatroomId;
    updateScroll();

    consumer.subscriptions.create(
      { channel: 'ChatroomChannel', id: id },
      {
        received(data) {
          const user_element = document.getElementById("navbarDropdown");
          const user_id = Number(user_element.getAttribute("data-user-id"));
          
          if (user_id === data.message.user_id) {
            messagesContainer.insertAdjacentHTML('beforeend', data.sender);
            updateScroll();
          } else {
            messagesContainer.insertAdjacentHTML('beforeend', data.receiver);
            updateScroll();
          }

          document.getElementById("message_content").value = '';
          // console.log (data);
        },
      }
    );
  };
};

export { initChatroomCable };
