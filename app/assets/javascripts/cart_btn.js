$(document).ready(function(){
  $(".btn-cart").click(function(){
    if ($(document).ajaxSuccess()) {
      $(this).html("<i class='fas fa-check'></i>");
    };
  });
});
