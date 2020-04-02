$(document).on 'turbolinks:load', ->
  $('.votes').on 'click', (e) ->
    $('#flash_messages').html('')

  $('.votes').on('ajax:success', (e) ->
    vote = e.detail[0]
    console.log(vote)
    $('#' + vote.model + '-' + vote.object_id + ' .votes-count').html(vote.value)
  ).on('ajax:error', (e) ->
    errors = e.detail[0]
    console.log(errors)
    $.each errors, (_field, array) ->
      $('#answers').append('<div class="alert fade show", role: "alert">' + array + '</div>')
  )
