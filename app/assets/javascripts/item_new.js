$(function(){
  $('.exhibition-image-container__field').on('click',function(){
    $('#file').get(0).click();
  })

  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = 
    `
    <div class="product-details-container__top__select--children">
      <select class="listing-select__box",id="children-category",name="item[category]">
        <option value="選択してください"></option>
        ${insertHTML}
      </select>
    </div>`;
    $('.product-details-container__top').append(childSelectHtml);
  }

  $("#parent-category").on("change",function(){
    var parentCategory = $("#parent-category").val();
    
    if (parentCategory != "選択してください"){
      $.ajax({
        url:"get_category_children",
        type:"get",
        data:{parent_name:parentCategory},
        dataType:'json',
      })
      .done(function(children){
        var children = $(parentCategory.children)
        $('.product-details-container__top__select--children').remove();
        var insertHTML = '';
        children.each(function(child){
          insertHTML += appendOption(child);
        })
        appendChildrenBox(insertHTML);
      })
    }
  })
})


