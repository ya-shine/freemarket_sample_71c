$(document).on('turbolinks:load', function() {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="image-uploads" data-index="${index}" >
                    <input id="file" type="file" height="100%" width="100%"
                    name="product[images_attributes][${index}][src]"
                    id="product_images_attributes_${index}_src"><br>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.exhibition-image-container__field').on('change', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('.exhibition-image-container__field').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  // $('.exhibition-image-container__field').on('click', function() {
  //   $(this).parent().remove();
  //   // 画像入力欄が0個にならないようにしておく
  //   if ($('#file').length == 0){
  //     $('.exhibition-image-container__field').append(buildFileField(fileIndex[0]));
  //   } 
  // });
});