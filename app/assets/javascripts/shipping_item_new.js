$(function(){
  $('#item_delivery_fee_id').on('change',function(){
    var box_status = $('#item_delivery_fee_id').val();
    console.log(box_status);
    if(box_status == 1 || box_status == 2){
      $('.delivery-container__top-derivation').css('display','block');
    }
    else{
      $('.delivery-container__top-derivation').css('display','none');
    }
  })
})