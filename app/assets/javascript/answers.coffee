$(document).on 'turbolinks:load', ->
  $('.answers').on 'click', '.edit-answer-link', (event) ->
    event.preventDefault()
    $(this).hide()
    AnswerId = $(this).data('answerId')
    $('form#edit-answer-' + AnswerId).removeClass 'hidden'

  App.cable.subscriptions.create('AnswersChannel', {
    connected: ->
      console.log 'Connected!'
      @perform 'follow'
    ,

    received: (data) ->
      $('.answers-list').append data
  })
