class Dashing.Powernumber extends Dashing.Widget
  @accessor 'current', Dashing.AnimatedValue

  @accessor 'capacity_used', ->
    if @get('state')
      color_map = { 'VIC' : '#F7BE81', 'SA' : '#BCF5A9', 'NSW' : '#A9E2F3', 'QLD' : '#D0A9F5', 'TAS' : '#F5A9BC' }
      $(@node).css("background-color", color_map[@get('state')])
    if @get('max')
      max = parseInt(@get('max'))
      current = parseInt(@get('current'))
      if max != 0
        pct = Math.abs(Math.round(current / max * 100))
        "#{pct}%"
    else
      ""

  @accessor 'arrow', ->
    if @get('last')
      if parseInt(@get('current')) > parseInt(@get('last')) then 'icon-arrow-up' else 'icon-arrow-down'

  onData: (data) ->
    if data.status
      # clear existing "status-*" classes
      $(@get('node')).attr 'class', (i,c) ->
        c.replace /\bstatus-\S+/g, ''
      # add new class
      $(@get('node')).addClass "status-#{data.status}"
