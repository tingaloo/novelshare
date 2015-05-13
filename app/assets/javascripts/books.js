$( document ).ready(function() {
    console.log($(".books").hasClass("columns"));
    var myClass = $('.unavailable');


    // On book hover, change to red/green
    $(".index-book").mouseenter(function()
    {

      if ($(".index-book").hasClass("unavailable")){
        $(this).closest(".unavailable").css("border-color", "red");
      }

      if ($(".index-book").hasClass("available")){
        $(this).closest(".available").css("border-color", "green");
      }

    });

    //on mouse leave, book changes back
    $(".index-book").mouseleave(function() {
        $(this).css("border-color", "#C5EFF7");
    });


    $("#toggle-available").mouseenter(function() {
      $(".available").css("border-color", "green");
    });
    $("#toggle-unavailable").mouseenter(function() {
      $(".unavailable").css("border-color", "red");
    });
    $("#toggle-new").mouseenter(function() {
      $(".just_added").css("border-color", "purple");
    });

    // on mouse leave, status children will return
    $(".status-toggles").children().mouseleave(function() {
      $(".index-book").css("border-color", "#C5EFF7");
    });

});
