$(document).on("turbolinks:load", function(){
  $('.answers').on('click', '.edit-answer-link', function(e){
    e.preventDefault();
    $(this).hide();
    var editAnswerId = $(this).data('answerId');
    $("form#edit-answer-" + editAnswerId).removeClass('hidden');
  });
});
