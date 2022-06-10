import consumer from "channels/consumer"

document.addEventListener("turbo:load",()=>{
  
  const room_number = location.pathname.split('/')[2]
  
  consumer.subscriptions.create({channel:"ChatChannel",room_id:room_number}, {
    connected() {
      console.log("connected to ",room_number)
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      console.log(data)
      let message = `<div class="card mb-1 ">
                        <div class="card-header" style="background-color: turquoise;">
                            ${data.user}
                        </div>
                        <div class="card-body ">
                            ${data.message}
                        </div>
                    </div>`;
  
      var objDiv = document.getElementById("message-box")
      objDiv.insertAdjacentHTML("beforeend",message);
      objDiv.scrollTop = objDiv.scrollHeight;
    
    }
  });  





})

