$(document).on("turbolinks:load", function(){
  $('.question').on('click', '.edit-question-link', function(event){
    event.preventDefault();
    $(this).hide();
    $('.control-panel').hide();
    $('.question-title').hide();

    var QuestionId = $(this).data('questionId');
    $("form#edit-question-" + QuestionId).removeClass('hidden');
  });
});