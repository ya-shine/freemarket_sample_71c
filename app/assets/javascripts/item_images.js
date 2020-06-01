$(function(){
  var slider = "#slider";
  var thumbnailItem = "#thumbnail-list .thumbnail-item";
  
  $(thumbnailItem).each(function(){
   var index = $(thumbnailItem).index(this);
   $(this).attr("data-index",index);
  });
  

  $(slider).on('init',function(slick){
   var index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
   $(thumbnailItem+'[data-index="'+index+'"]').addClass("thumbnail-current");
  });
  $(slider).on('beforeChange',function(event,slick, currentSlide,nextSlide){
    $(thumbnailItem).each(function(){
      $(this).removeClass("thumbnail-current");
    });
    $(thumbnailItem+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
  });
  $(thumbnailItem).on('click',function(){
    var index = $(this).attr("data-index");
    $(slider).slick("slickGoTo",index,false);
  });

  $(slider).slick({
    arrows: false,
    fade: true,
    infinite: false,
    centerMode: true,
  });
});


$(function(){
  $('.category-title-box').on('mouseover',function(){
    $('.categories-container').css('background-color',"#aaf")
  })
})