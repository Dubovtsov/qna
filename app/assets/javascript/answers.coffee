$ ->
  $('.answers').on 'click', '.edit-answer-link', (event) ->
    event.preventDefault()
    $(this).hide()
    AnswerId = $(this).data('answerId')
    $('form#edit-answer-' + AnswerId).removeClass 'hidden'

  questionId = $('.question').data 'questionId'
  if questionId
    App.cable.subscriptions.create { channel: 'AnswersChannel', id: questionId },
    connected: ->
      @perform 'follow'
      App.channels.push this
    ,
    received: (data) ->
      if current_user.id != data.answer.user_id
        $('.answers-list').append JST["answers/answer"]( { answer: data.answer, links: data.links, files: data.files } )
