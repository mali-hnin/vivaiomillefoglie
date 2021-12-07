function dismissEvent() {
  var x = document.getElementById("eventBox");
  x.style.display = "none";
}

$(document).ready(function(){
  $(".btn1").click(function(){
    $("#eventBox").fadeOut();
  });
});
