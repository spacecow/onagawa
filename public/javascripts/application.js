$(function(){
  $("div#image_container").mouseover(function(){
    $("img").css("visibility","visible")
  });
  $("div#image_container").mouseleave(function(){
    $("img").css("visibility","hidden")
  });
});
