$(function(){
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class="add-select-wrapper" id= "children_wrapper">
                        <div class="add-select-wrapper__box">
                          <select class="add-select-wrapper__box--select" id="child_category" name="category_id">
                            <option value="---" data-category="---">選択してください</option>
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
                                <select class="add-select-wrapper__box--select" id="grandchild_category" name="category_id">
                                  <option value="---" data-category="---">選択してください</option>
                                  ${insertHTML}
                                </select>
                                <i class='fas fa-chevron-down icon-arrow-down'></i>
                              </div>
                            </div>`;
    $('.product-details-container__top').append(grandchildSelectHtml);
  }
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != "---"){
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
    if (childId != "---"){
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
          $('#brand_wrapper').remove();
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
});
