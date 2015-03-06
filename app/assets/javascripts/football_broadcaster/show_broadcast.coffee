jQuery ->
  log = $('#broadcast_log')
  if log.length > 0
    broadcast_id = log.data('broadcast')
    broadcast_pane = log.find('ul')
    update_log = $('#update_log')
    loading = false

    get_messages_since = ->
      unless loading
        $.ajax({
          url: '/football_broadcaster/api/log_for_broadcast'
          data: {
            broadcast_id: broadcast_id
            last_log_message_id: log.find('li').first().data('id')
          }
          dataType: 'json'
          beforeSend: ->
            update_log.addClass('disabled')
            loading = true
          complete: ->
            update_log.removeClass('disabled')
            loading = false
          success: (data) ->
            $.each(data['new_messages'], ->
              message_template = HandlebarsTemplates['log_messages/show'](this)
              broadcast_pane.prepend(message_template)
            )
          error: (xhr, status, message) ->
            console.warn('Cannot load log message: ' + message)
        })

    #setTimeout(->

    #, 5000)

    update_log.click -> get_messages_since()