#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require jquery-ui
#= require jquery-ui/datepicker
#= require darkly/loader
#= require turbolinks
#= require raphael
#= require morris
#= require highcharts
#= require highcharts/highcharts-more
#= require chartkick
#= require moment
#= require bootstrap-datetimepicker
#= require forem

$ ->
  $('.datepicker').datetimepicker
    sideBySide: true
    format: 'DD-MM-YYYY LT'
