$( document ).ready(function() {
    console.log($(".books").hasClass("columns"));
    var myClass = $('.unavailable');
    $("#toggle-available").hover(function() {

      if ($(".books").hasClass("available")) {
         // alert("hi");
        console.log($(".books").hasClass("columns"));
      }

      // console.log($(".row").hasClass("column"));
      $("unavailable").css("border-color", "red");

    });


});
