$(function(){
  var text_max = 1000;
  $('#item_description').on('input',function(){
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
  } else {
    $('.price-container__contents__fee--value').text('ー');
    $('.price-container__contents__profit--value').text('ー');
  }
  })
  $('#item_delivery_fee_id').on('change',function(){
    var box_status = $('#item_delivery_fee_id').val();
    if(box_status == 1 || box_status == 2){
      $('.delivery-container__top-derivation').css('display','block');
    } else {
      $('.delivery-container__top-derivation').css('display','none');
    }
  })

  if (window.location.href.match(/\/items\/\d+\/edit/)) {
    var text_max = 1000;
    $('#item_description').load('input',function(){
      $('.count').text($(this).val().length + "/1000");
    })

    $('#item_price').load('input',function(){
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
    } else {
      $('.price-container__contents__fee--value').text('ー');
      $('.price-container__contents__profit--value').text('ー');
    }
    })
    $('#item_delivery_fee_id').load('change',function(){
      var box_status = $('#item_delivery_fee_id').val();
      if(box_status == 1 || box_status == 2){
        $('.delivery-container__top-derivation').css('display','block');
      } else {
        $('.delivery-container__top-derivation').css('display','none');
      }
    })
  }
});