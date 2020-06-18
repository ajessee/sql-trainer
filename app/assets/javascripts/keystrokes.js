var map = {};

onkeydown = onkeyup = function(e){
    e = e || event; // to deal with IE
    map[e.keyCode] = e.type == 'keydown';
    
    if (map[16] && map[13]) {
      console.log("shift + end");
      document.querySelector('#run-button').click();
      map = {}
    }
  
}