define [
  'views/base/view',
  'views/modules/bike_row'
], (View, BikeRow) ->
  class BikesIndex extends View
    el: 'body'
    autoRender: true

    render: ->
      @$('tr.bike').each (i, el) =>
        new BikeRow {model: @collection.at(i), el}