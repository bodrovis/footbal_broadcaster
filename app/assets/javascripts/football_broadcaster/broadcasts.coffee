jQuery ->
  participating_list = $('#participating_players_list')
  add_fields = participating_list.find('.add_fields')
  home_team_select = $('#broadcast_home_team_id')
  guest_team_select = $('#broadcast_guest_team_id')

  # We have to recreate custom template each time a team is selected
  update_players_template = ->
    $.ajax({
      url: '/football_broadcaster/api/teams_players'
      data: teams: home_team_select.val() + ',' + guest_team_select.val()
      dataType: 'json'
      success: (data) ->
        template = HandlebarsTemplates['players/index'](data)
        participating_list.find('.add_fields').data('association-insertion-template', template).show()
        participating_list.find('.nested-fields').remove()
      error: (xhr, status, message) ->
        console.warn('Cannot load players: ' + message)
    })

  add_fields.data('association-insertion-template', null).hide()
  $(home_team_select).on 'change', update_players_template
  $(guest_team_select).on 'change', update_players_template

  return