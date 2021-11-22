$(document).ready(function(){
  $("#mobileMenuBtn,#modalBg").click(function(){
    $("#mobileMenu").toggleClass("mobile-menu-closed");
    $("#modalBg").toggleClass("modal-opaque-bg");
    $("body").toggleClass("no-scroll");

    if ($("#mobileMenuBtn").html() == "☰") {
      $("#mobileMenuBtn").html("🗙");
    } else if ($("#mobileMenuBtn").html() == "🗙") {
      $("#mobileMenuBtn").html("☰");
    }
  });
});
