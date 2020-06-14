$(function(){
  var text_max = 1000;
  $('#item_content').on('input',function(){
    $('.count').text($(this).val().length + "/1000");
  })

  $('#item_price').on('input',function(){
    var totalPrice = $('#item_price').val();
    var profit = Math.round(totalPrice * 0.9)
    var fee = (totalPrice - profit)
    var profitShow = profit.toLocaleString()
    var feeShow = fee.toLocaleString()
  if(totalPrice >= 300 && totalPrice <= 9999999){
  $('.price-container__contents__fee--value').text(feeShow)
  $('.price-container__contents__fee--value').prepend("￥")
  $('.price-container__contents__profit--value').text(profitShow)
  $('.price-container__contents__profit--value').prepend("￥")
  } else{
    $('.price-container__contents__fee--value').text('ー');
    $('.price-container__contents__profit--value').text('ー');
  }
  })
})