$ ->
  $('form').live 'submit', (event) ->
    event.preventDefault()
    form = $(event.target)
    action = form.attr('action')

    $.ajax
      url: action
      dataType: 'json'
      data: form.serialize()
      type: 'POST'
      success: (data, textStatus, jqXH) ->
        content = "<li>#{data.name}</li>"
        $('#todos_container').append content
      error: (response) ->
        console.log('fail')
