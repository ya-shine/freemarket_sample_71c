$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class="add-select-wrapper" id= "children_wrapper">
                        <div class="add-select-wrapper__box">
                          <select class="add-select-wrapper__box--select" id="child_category" name="">
                            <option value="" data-category="">選択してください</option>
                            ${insertHTML}
                          </select>
                          <i class="fas fa-chevron-down icon-arrow-down"></i>
                        </div>
                      </div>`;
    $('.product-details-container__top').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class="add-select-wrapper" id= "grandchildren_wrapper">
                              <div class="add-select-wrapper__box">
                                <select class="add-select-wrapper__box--select" id="grandchild_category" name="item[category_id]">
                                  <option value="" data-category="">選択してください</option>
                                  ${insertHTML}
                                </select>
                                <i class='fas fa-chevron-down icon-arrow-down'></i>
                              </div>
                            </div>`;
    $('.product-details-container__top').append(grandchildSelectHtml);
  }
  function appendSizeOption(size){
    var html = `<option value="${size.id}">${size.name}</option>`;
    return html;
  }
  // サイズ入力欄の表示作成
  function appendSizeBox(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="listing-product-detail__size" id= 'size_wrapper'>
                        <label class="listing-default__label" for="サイズ">サイズ</label>
                        <span class='listing-default--require'>必須</span>
                        <div class='listing-select-wrapper__added--size'>
                          <div class='listing-select-wrapper__box'>
                            <select id="size" name="item[size_id]">
                            <option value="---">
                              選択してください
                            </option>
                              ${insertHTML}
                            </select>
                            <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
                          </div>
                        </div>
                      </div>`;
    $('.product-details-container__top').append(sizeSelectHtml);
  }
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != ''){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.product-details-container__top').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != ""){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  $('.product-details-container__top').on('change', '#grandchild_category', function(){
    var grandchildId = $('#grandchild_category option:selected').data('category'); //選択された孫カテゴリーのidを取得
    if (grandchildId != ""){ //孫カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_size',
        type: 'GET',
        data: { grandchild_id: grandchildId },
        dataType: 'json'
      })
      .done(function(sizes){
        if (sizes.length != 0) {
          $('#size_wrapper').remove(); //孫が変更された時、サイズ欄以下を削除する
          var insertHTML = '';
            sizes.forEach(function(size){
              insertHTML += appendSizeOption(size);
            });
          appendSizeBox(insertHTML);
        }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました');
      })
    }else{
      $('#size_wrapper').remove(); //孫カテゴリーが初期値になった時、サイズ欄以下を削除する
      $('#brand_wrapper').remove();
    }
  });
});
