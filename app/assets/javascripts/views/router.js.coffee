define ['backbone'], (Backbone) ->
  class CopeRouter extends Backbone.Router
    routes:
      'checkouts': 'showCheckouts'

    showCheckouts: ->
      alert('hi!')