$(document).ready(function(){
  $("#mobileMenuBtn,#modalBg").click(function(){
    $("#mobileMenu").toggleClass("mobile-menu-open");
    $("#modalBg").toggleClass("modal-opaque-bg");
    $("body").toggleClass("no-scroll");
    if ($("#mobileMenuBtn").html() == "<i class=\"fas fa-bars\"></i>") {
      $("#mobileMenuBtn").html("<i class=\"fas fa-times\"></i>");
    } else if ($("#mobileMenuBtn").html() == "<i class=\"fas fa-times\"></i>") {
      $("#mobileMenuBtn").html("<i class=\"fas fa-bars\"></i>");
    }
  });
});
