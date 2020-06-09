$(function(){
  var text_max = 1000;
  $('#item_content').on('keyup',function(){
    $('.count').text($(this).val().length + "/1000");
  })

  $('#item_item').on('input',function(){
    var totalPrice = $('#item_item').val();
    var profit = Math.round(totalPrice * 0.9)
    var fee = (totalPrice - profit)
    $('.price-container__contents__fee--value').text(fee)
    $('.price-container__contents__fee--value').prepend("￥")
    $('.price-container__contents__profit--value').text(profit)
    $('.price-container__contents__profit--value').prepend("￥")
  })
})