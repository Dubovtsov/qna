$ ->
  $('.question').on 'click', '.edit-question-link', (event) ->
    event.preventDefault()
    $(this).hide()
    $('.control-panel').hide()
    $('.question-title').hide()
    QuestionId = $(this).data('questionId')
    $('form#edit-question-' + QuestionId).removeClass 'hidden'

  App.cable.subscriptions.create('QuestionsChannel', {
    connected: ->
      console.log 'Connected!'
      @perform 'follow'
    ,

    received: (data) ->
      $('.questions-list').append data
  })
