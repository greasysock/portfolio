# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = undefined

ready = ->
  Sortable.create( document.getElementById('sortable'), {
      animation: 150,
      ghostClass: 'blue-background-class'
  } )
  return

$(document).ready ready