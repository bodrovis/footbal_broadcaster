jQuery ->
  if $('#new_broadcast').length > 0
    participating_list = $('#participating_players_list')
    add_fields = participating_list.find('.add_fields')
    home_team_select = $('#broadcast_home_team_id')
    guest_team_select = $('#broadcast_guest_team_id')
    roster = $('#teams_roster')
    teams_vs = $('#teams_vs')

    # We have to recreate custom template each time a team is selected
    update_players_template = ->
      home = home_team_select.val()
      guest = guest_team_select.val()

      if home && guest && home isnt guest
        $.ajax({
          url: '/football_broadcaster/api/teams_players'
          data: {
            home: home
            guest: guest
          }
          dataType: 'json'
          beforeSend: ->
            home_team_select.prop {disabled: true}
            guest_team_select.prop {disabled: true}
          complete: ->
            home_team_select.prop {disabled: false}
            guest_team_select.prop {disabled: false}
          success: (data) ->
            players_template = HandlebarsTemplates['players/index'](data)
            vs_template = HandlebarsTemplates['teams/vs']({
              home: home_team_select.find(':selected').text(),
              guest: guest_team_select.find(':selected').text()
            })
            participating_list.find('.add_fields').data('association-insertion-template', players_template).show()
            participating_list.find('.nested-fields').remove()
            teams_vs.html(vs_template)
          error: (xhr, status, message) ->
            console.warn('Cannot load players: ' + message)
        })

    update_roster = ->
      $this = $(this)
      player_block = $this.parents('.nested-fields')
      selected_player = $this.find(':selected')
      side = selected_player.parent().data('side')
      unless side is player_block.data('side')
        player_block.data('side', side)
        $('#' + side + '_roster').append(player_block)


    add_fields.data('association-insertion-template', null).hide()
    $(home_team_select).on 'change', update_players_template
    $(guest_team_select).on 'change', update_players_template

    # Bind to the parent as selects are added and removed dynamically
    $(participating_list).on 'change', '.select_player', update_roster

  return