$(document).ready(function() {
  $('.b-btn-next').on('click', function() {
    $(this).parent().parent().toggle(false);
    $(this).parent().parent().next().toggle(true);
    var formId = $(this).parent().parent().next().attr("id");
    $('#form-step-indicator').removeClass().addClass(formId);
    var obj = ".bubble" + "." + formId;
    $(obj).addClass('active');
  });

  $('.b-btn-return').on('click', function() {
    $(this).parent().parent().toggle(false);
    $(this).parent().parent().prev().toggle(true);
    var formId = $(this).parent().parent().prev().attr("id");
    $('#form-step-indicator').removeClass().addClass(formId);
    var actualId = $(this).parent().parent().attr("id");
    var obj = ".bubble" + "." + actualId;
    $(obj).removeClass('active');
  });

  $('#ajouter-photos-btn').on('click', function() {
    $('#dressing_item_photos').trigger('click');
  });

  $('#dressing_item_photos').change(function() {
      var val = ($(this).val() != "") ? ($(this)[0].files.length + " fichier choisi(s)") : "Aucun fichier choisi";
      $('.filename').attr('placeholder', val);
  });

  $('#ajouter-photos-missing-items-btn').on('click', function() {
    $('#missing_item_photos').trigger('click');
  });

  $('#missing_item_photos').change(function() {
      var val = ($(this).val() != "") ? ($(this)[0].files.length + " fichier choisi(s)") : "Aucun fichier choisi";
      $('.missing-item-filename').attr('placeholder', val);
  });

  $('.ajouter-photos-proposal-btn').on('click', function() {
    target = "#proposal_photos_" + $(this).data('id');
    $(target).trigger('click');
  });

  $('.proposal_photos').change(function() {
      var target = "#proposal-filename-" + $(this).data('target');
      var val = ($(this).val() != "") ? ($(this)[0].files.length + " fichier choisi(s)") : "Aucun fichier choisi";
      $(target).attr('placeholder', val);
  });
});
