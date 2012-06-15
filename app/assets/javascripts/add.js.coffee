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
        content = "<li>"
        content += "<a href=\"/todos/#{data.id}/edit\">#{data.name}</a>"
        content += "<a href=\"/todos/#{data.id}\" data-method='delete' rel='nofollow'>X</a></li>"
        content += "</li>"
        $('#todos_container').append content

      error: (response) ->
        console.log('fail')
