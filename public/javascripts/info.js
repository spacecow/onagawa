$(function(){
  $("div#image img:last-child").css("visibility", "hidden")
  $("div#image_container").remove()
  $("div#image img").mouseover(function(){
    $("div#image img:last-child").css("visibility", "visible")
  });
  $("div#image img").mouseout(function(){
    $("div#image img:last-child").css("visibility", "hidden")
  });
});
