$(function () {
  var methods = {
    email: function (value, element) {
      return this.optional(element) || /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/i.test(value);
    },
    password: function (value, element) {
      return this.optional(element) || /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}$/i.test(value);
    },
    last_name: function (value, element) {
      return this.optional(element) || /^[^\x20-\x7e]*$/i.test(value);
    },
    first_name: function (value, element) {
      return this.optional(element) || /^[^\x20-\x7e]*$/i.test(value);
    },
    last_name_kana: function (value, element) {
      return this.optional(element) || /^[ァ-ンヴー]*$/i.test(value);
    },
    first_name_kana: function (value, element) {
      return this.optional(element) || /^[ァ-ンヴー]*$/i.test(value);
    },
  }
  $.each(methods, function (key) {
    $.validator.addMethod(key, this);
  });
  $("#new_user").validate({
    rules: {
      "user[nickname]": {
        required: true
      },
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        password: true,
        minlength: 7
      },
      "user[password_confirmation]": {
        required: true,
        password: true,
        minlength: 7,
        equalTo: "#user_password"
      },
      "user[last_name]": {
        required: true,
        last_name: true
      },
      "user[first_name]": {
        required: true,
        first_name: true
      },
      "user[last_name_kana]": {
        required: true,
        last_name_kana: true
      },
      "user[first_name_kana]": {
        required: true,
        first_name_kana: true
      },
      "user[birth_day(1i)]": {
        required: true
      },
      "user[birth_day(2i)]": {
        required: true
      },
      "user[birth_day(3i)]": {
        required: true
      },
    },
    messages: {
      "user[nickname]": {
        required: "ニックネームを入力してください"
      },
      "user[email]": {
        required: "メールアドレスを入力してください",
        email: "フォーマットが不適切です"
      },
      "user[password]": {
        required: "パスワードを入力してください",
        password: "英字と数字両方含むパスワードを入力してください",
        minlength: "7文字以上で入力してください"
      },
      "user[password_confirmation]": {
        required: "確認用パスワードを入力してください",
        password: "英字と数字両方含むパスワードを入力してください",
        minlength: "7文字以上で入力してください",
        equalTo: "パスワードが一致しません"
      },
      "user[last_name]": {
        required: "",
        last_name: ""
      },
      "user[first_name]": {
        required: "お名前を入力してください",
        last_name: "全角で入力してください"
      },
      "user[last_name_kana]": {
        required: "",
        last_name_kana: ""
      },
      "user[first_name_kana]": {
        required: "お名前（カナ）を入力してください",
        last_name_kana: "全角（カナ）で入力してください"
      },
      "user[birth_day(1i)]": {
        required: ""
      },
      "user[birth_day(2i)]": {
        required: ""
      },
      "user[birth_day(3i)]": {
        required: "生年月日を入力してください"
      },
    },
    errorClass: "invalid",
    errorElement: "span",
    validClass: "valid",
  });
  $("#user_nickname", "#user_email", "#user_password", "#user_password_confirmation", "#user_last_name", "#user_first_name", "#user_last_name_kana", "#user_first_name_kana", "#user_birth_day_1i", "#user_birth_day_2i", "#user_birth_day_3i").blur(function () {
    $(this).valid();
  });
});