$(document).on("turbolinks:load", function(){
  $('.question').on('click', '.edit-question-link', function(e){
    e.preventDefault();
    $(this).hide();
    $('.control-panel').hide();
    $('.question-title').hide();

    var editQuestionId = $(this).data('questionId');
    $("form#edit-question-" + editQuestionId).removeClass('hidden');
  });
});