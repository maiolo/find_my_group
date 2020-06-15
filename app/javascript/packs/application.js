require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');

import 'bootstrap';
// import Swal from 'sweetalert2/dist/sweetalert2.js';
import { initChatroomCable } from '../channels/chatroom_channel';


document.addEventListener('turbolinks:load', () => {
  initChatroomCable();
});

// window.Swal = Swal;