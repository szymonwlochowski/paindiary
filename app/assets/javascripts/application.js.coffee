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
#= require_self

$(document).on 'ready page:load', ->
  $('.datepicker').datetimepicker
    sideBySide: true
    format: 'DD-MM-YYYY LT'

$ ->
  $.rails.allowAction = (link) ->
    return true unless link.attr('data-confirm')
    $.rails.showConfirmDialog(link)
    false

  $.rails.confirmed = (link) ->
    link.removeAttr('data-confirm')
    link.trigger('click.rails')
    link.closest('.post').fadeOut
      duration: 600

  $.rails.showConfirmDialog = (link) ->
    message = link.attr 'data-confirm'
    html = """
          <div class="modal" id="confirmationDialog">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <a class="close" data-dismiss="modal">×</a>
                  <h3>#{message}</h3>
                </div>
                <div class="modal-body">
                  <p>Are you sure?</p>
                </div>
                <div class="modal-footer">
                  <a data-dismiss="modal" class="btn">Cancel</a>
                  <a data-dismiss="modal" class="btn btn-primary confirm">Yes, delete it.</a>
                </div>
              </div>
            </div>
          </div>
           """
    $(html).modal()
    $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)
