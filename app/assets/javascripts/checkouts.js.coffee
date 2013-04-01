# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#checkout_biker_netid').typeahead
    name: 'bikers'
    prefetch: '/bikers.json'