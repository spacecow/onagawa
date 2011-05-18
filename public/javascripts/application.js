$(function(){
  $("div#image_container").mouseover(function(){
    $("div#image_container img").css("visibility","visible")
  });
  $("div#image_container").mouseleave(function(){
    $("div#image_container img").css("visibility","hidden")
  });
});
