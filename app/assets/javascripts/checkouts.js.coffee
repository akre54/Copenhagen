# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#checkout_biker_netid').typeahead
    name: 'bikers'
    valueKey: 'netid'
    prefetch:
      url: '/bikers.json'
      filter: (resp) ->
        for biker in resp
          biker.tokens = biker.full_name.split(' ').concat(biker.netid)
        resp
    template: (data) ->
      "<div class='tt-suggestion'><p>#{data.full_name} <strong>(#{data.netid})</strong></p></div>"
