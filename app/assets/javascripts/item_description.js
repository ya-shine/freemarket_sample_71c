$(function(){
  var text_max = 1000;
  $('#item_content').on('keyup',function(){
    $('.count').text($(this).val().length + "/1000");
  })
})