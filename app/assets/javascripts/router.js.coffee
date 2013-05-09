define ['require', 'backbone'], (require, Backbone) ->
  class CopeRouter extends Backbone.Router
    routes:
      'bikes': 'bikesIndex'
      'bikes/:id': 'bikesShow'
      'bikes/:bike_id/checkouts': 'checkoutsIndex'
      'bikes/:bike_id/checkouts/new': 'checkoutsNew'
      'checkouts': 'checkoutsIndex'
      'checkouts/:id': 'checkoutsShow'
      'checkouts/new': 'checkoutsNew'

    bikesIndex: ->
      require ['views/pages/bikes_index', 'models/bikes_collection'], (BikesIndexView, BikesCollection) ->
        @collection = new BikesCollection(COPE.bikes)
        new BikesIndexView {@collection}

    BikesShow: (id) ->
      require ['views/pages/bikes_show'], (BikesShowView) ->
        new BikesShowView

    CheckoutsIndex: (bike_id = null) ->
      require ['views/pages/checkouts_index'], (CheckoutsIndexView) ->
        new CheckoutsIndexView

    checkoutsShow: (id) ->
      require ['views/pages/checkouts_show'], (CheckoutsShowView) ->
        new CheckoutsShowView

    checkoutsNew: (bike_id = null) ->
      require ['views/pages/checkouts_new'], (CheckoutsNewView) ->
        new CheckoutsNewView