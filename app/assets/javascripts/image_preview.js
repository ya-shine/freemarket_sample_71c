$(function(){

  function buildHTML(index) {
    var html = `<div class="preview-box" id="preview-box__${index}" name="item[image]">
                  <div class="upper-box">
                    <img src="" alt="preview">
                  </div>
                  <div class="lower-box">
                    <div class="delete-box" id="delete_btn_${index}">
                      <span>削除</span>
                    </div>
                  </div>
                </div>`
    return html;
  }

  if (window.location.href.match(/\/items\/\d+\/edit/)) {
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
    $('.preview-box').each(function(index, box) {
      $(box).attr('id', `preview-box__${index}`);
      $(box).attr('name', `item[image]`);
    })
    $('.delete-box').each(function(index, box) {
      $(box).attr('id', `delete_btn_${index}`);
    })
    var count = $('.preview-box').length;
    if (count == 5) {
      $('.label-content').hide();
    }
  }

  function setLabel() {
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
  }


  $(document).on('click', '.label-content', function(){
    var countVal0 = $('#preview-box__0').val()
    var countVal1 = $('#preview-box__1').val()
    var countVal2 = $('#preview-box__2').val()
    var countVal3 = $('#preview-box__3').val()
    var countVal4 = $('#preview-box__4').val()
    if(countVal0 == undefined){
      var image0 = $('.label-box').prop('for','item_images_attributes_0_image')
      console.log(image0)
    }else if(countVal0 == '' && countVal1 == undefined ){
      var image1 = $('.label-box').prop('for','item_images_attributes_1_image')
      console.log(image1)
    }else if(countVal0 == '' && countVal1 == '' && countVal2 == undefined){
      var image2 = $('.label-box').prop('for','item_images_attributes_2_image')
      console.log(image2)
    }else if(countVal0 == '' && countVal1 == '' && countVal2 == '' && countVal3 == undefined){
      var image3 = $('.label-box').prop('for','item_images_attributes_3_image')
      console.log(image3)
    }else if(countVal0 == '' && countVal1 == '' && countVal2 == '' && countVal3 == '' && countVal4 == undefined){
      var image4 = $('.label-box').prop('for','item_images_attributes_4_image')
      console.log(image4)
    }
  })

  $(document).on('change', '.hidden-field', function() {
    setLabel();
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      if ($(`#preview-box__${id}`).length == 0) {
        var count = $('.preview-box').length;
        var html = buildHTML(id);
        var prevContent = $('.label-content').prev();
        $(prevContent).append(html);
      }
      $(`#preview-box__${id} img`).attr('src', `${image}`);
      var count = $('.preview-box').length;
      if (count == 5) { 
        $('.label-content').hide();
      }

      if ($(`#item_images_attributes_${id}__destroy`)) {
        $(`#item_images_attributes_${id}__destroy`).prop('checked', false);
      }

      setLabel();
      if(count < 5){
        $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
      }
    }
  });

  $(document).on('click', '.delete-box', function() {
    var count = $('.preview-box').length;
    setLabel(count);
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    $(`#preview-box__${id}`).remove();

    if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
      $(`#item_images_attributes_${id}_image`).val("");
      var count = $('.preview-box').length;
      if (count == 4) {
        $('.label-content').show();
      }
      setLabel(count);
      if(id < 5){
        $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      }
    } else {
      
      $(`#item_images_attributes_${id}__destroy`).prop('checked', true);
      if (count == 4 ) {
        $('.label-content').show();
      }

      setLabel();
      if(id < 5){
        $('.label-box').attr({id: `label-box--${id}`, for: `item_images_attributes_${id}_image`});
      }
    }
  });

  $('.lower-box').on('click', function(){
    var widthCheck = $('.label-content').width();
    if(widthCheck != 493){
      $('.alert').css('display','none');
    }else{
      $('.alert').css('display','block')
    }
  })

  $('.button-container__exhibition').on('click', function(){
    var value_doc = $('.label-content').width();
    if(value_doc == 620){
      $('.alert').css('display','block')
      $(window).scrollTop(0);
      return false
    };
  })
});