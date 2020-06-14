$(function(){
  var methods = {
    text: function(value, element){
      return this.optional(element) || /^.{1,40}$/i.test(value)
    },
    content: function(value, element){
      return this.optional(element) || /^.{1,1000}$/i.test(value)
    },
    price: function(value, element){
      return this.optional(element) || /^.{300,9999999}$/i.test(value)
    },
    // : function(value, element){
    //   return this.optional(element) || 
    // }
  }
  $('#form-exibition').validate({
    rules:{
      "item[text]": {
        required: true,
        maxlength: 40
      },
      "item[content]":{
        required: true,
        maxlength: 1000
      },
      "item[category]":{
        required: true,
      },
      "item[price]":{
        required: true,
        price: true
      },
      "item[condition_id]":{
        required: true,
      },
      "item[delivery_fee_id]":{
        required: true,
      },
      "item[ship_from_area_id]":{
        required: true,
      }
    },
    messages: {
      "item[text]": {
        required: "入力してください。",
        maxlength: "40文字以内で入力してください。" 
      },
      "item[content]":{
        required: "入力してください。",
        maxlength: "1000文字以内で入力してください。"
      },
      "item[price]":{
        required: "入力してください。",
        price: "300以上9999999以下で入力してください"
      },
      "item[category]":{
        required: "入力してください。",
      },
      "item[condition_id]":{
        required: "入力してください。",
      },
      "item[delivery_fee_id]":{
        required: "入力してください。",
      },
      "item[ship_from_area_id]":{
        required: "入力してください。"
      },
    }
  })
})