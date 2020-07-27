$(function() {
  var conditionCheckAll = '#condition_all';
  var conditionCheckBox = 'input[name="q[condition_id_in][]"]';

  $(conditionCheckAll).on('click', function() {
    $(conditionCheckBox).prop('checked', $(this).is(':checked'));
  });

  $(conditionCheckBox).on('click', function() {
    var boxCount = $(conditionCheckBox).length;
    var checked = $(conditionCheckBox + ':checked').length;
    if (checked === boxCount) {
      $(conditionCheckAll).prop('cheked', true);
    } else {
      $(conditionCheckAll).prop('checked', false);
    }
  });
});

$(function() {
  var conditionCheckAll = '#delivery_fee_all';
  var conditionCheckBox = 'input[name="q[delivery_fee_id_in][]"]';

  $(conditionCheckAll).on('click', function() {
    $(conditionCheckBox).prop('checked', $(this).is(':checked'));
  });

  $(conditionCheckBox).on('click', function() {
    var boxCount = $(conditionCheckBox).length;
    var checked = $(conditionCheckBox + ':checked').length;
    if (checked === boxCount) {
      $(conditionCheckAll).prop('cheked', true);
    } else {
      $(conditionCheckAll).prop('checked', false);
    }
  });
});

$(function() {
  $('#clear').click(function() {
    $('.detail-search__form')[0].reset();
  });
});