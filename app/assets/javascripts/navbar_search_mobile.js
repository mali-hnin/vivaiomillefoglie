$(document).ready(function() {
  $("#navbarSearchMobile").click(function() {
    $("#navbarSearchBoxMobile").animate({
      width: "toggle"
    });
    $("#navbarSearchMobile").css("opacity", "0");
  })
});
