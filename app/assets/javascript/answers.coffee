$ ->
  $('.answers').on 'click', '.edit-answer-link', (event) ->
    event.preventDefault()
    $(this).hide()
    AnswerId = $(this).data('answerId')
    $('form#edit-answer-' + AnswerId).removeClass 'hidden'

  # questionId = $('.question-title').data 'questionId'
  # if questionId
  #   App.cable.subscriptions.create { channel: 'AnswersChannel', id: questionId },
  #   connected: ->
  #     console.log 'Connected!'
  #     @perform 'follow'
  #     # debugger
  #     # App.channels.push this
  #   ,
  #   received: (data) ->
  #     console.log 'Data return!'
  #     if current_user.id != data.answer.user_id
  #       $('.answers-list').append JST["answers/answer"]( { answer: data.answer, links: data.links, files: data.files } )
  questionId = $('.question-title').data 'questionId'
  if questionId
    App.cable.subscriptions.create { channel: 'AnswersChannel', id: questionId },
      connected: ->
        console.log 'Connected!'
        questionId = $('.question-title').data 'questionId'
        @perform 'follow'
      ,
      received: (data) ->
        console.log 'Data return!'
        # current_user_id = gon.current_user_id
        # debugger
        # if current_user_id != data.answer.user_id
        $('body').append data
          # $('.answers-list').append data
