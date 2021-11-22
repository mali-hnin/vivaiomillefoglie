$("#mobileMenuBtn").click(function(){
  $("#mobileMenu").toggleClass("mobile-menu-closed");
  if ($(this).html() == "☰") {
    $(this).html("🗙");
  } else if ($(this).html() == "🗙") {
    $(this).html("☰");
  }
});
