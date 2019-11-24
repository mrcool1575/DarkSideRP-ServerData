/*
  __  __           _            _                 _  __                         _____  
 |  \/  |         | |          | |               | |/ /                        |  __ \ 
 | \  / | __ _  __| | ___      | |__  _   _      | ' / __ _ ___ _ __   ___ _ __| |__) |
 | |\/| |/ _` |/ _` |/ _ \     | '_ \| | | |     |  < / _` / __| '_ \ / _ \ '__|  _  / 
 | |  | | (_| | (_| |  __/     | |_) | |_| |     | . \ (_| \__ \ |_) |  __/ |  | | \ \ 
 |_|  |_|\__,_|\__,_|\___|     |_.__/ \__, |     |_|\_\__,_|___/ .__/ \___|_|  |_|  \_\
                                       __/ |                   | |                     
                                      |___/                    |_|                     

  Author: Kasper Rasmussen
  Steam: https://steamcommunity.com/id/kasperrasmussen
*/

$(document).ready(function () {
  $(".container").hide();
  window.addEventListener('message', function (event) {
    var item = event.data;
    if (item.show == true) {
      open(item);
    }
    if (item.title) {
      document.getElementById("title").innerHTML = item.title;
    }
  });
});

function open(item) {
  $(".container").fadeIn();
  move(item);
}
function close(item) {
  $(".container").fadeOut();
  $.post('http://kasperr_progress_handler/close', JSON.stringify({
    type: item.type,
    event: item.event,
    args: item.args
  }));
}
function move(item) {
  var elem = document.getElementById("myBar");
  var width = 0;
  var id = setInterval(frame, item.time/100);
  function frame() {
    if (width >= 100) {
      clearInterval(id);
      close(item);
    } else {
      width++;
      elem.style.width = width + '%';
    }
  }
}