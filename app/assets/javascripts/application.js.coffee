#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require turbolinks
#= require raphael
#= require morris
#= require_tree .

jQuery ->
  Morris.Line
    element: 'pain_records'
    data:    $('#pain_records').data('records')
    xkey:    'date'
    ykeys:    ['total_amount'].concat(gon.descriptions)
    labels:   ['Total_amount'].concat(gon.descriptions)
