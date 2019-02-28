# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined

sort_update = (event) ->
  updated_order = []
  $('.card').each (i) ->
    updated_order.push
      id: $(this).data('id')
      position: i + 1
    return 
  $.ajax
    type: 'PUT'
    url: '/portfolios/sort'
    data: order: updated_order
  return

ready = ->
  Sortable.create( document.getElementById('sortable'), {
      animation: 150,
      ghostClass: 'blue-background-class',
      onSort: sort_update
  } )
  return

$(document).ready ready