$(document).on("turbolinks:load", function(){
  $('.answers').on('click', '.edit-answer-link', function(event){
    event.preventDefault();
    $(this).hide();
    var AnswerId = $(this).data('answerId');
    $("form#edit-answer-" + AnswerId).removeClass('hidden');
  });
});
