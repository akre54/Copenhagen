define ['backbone', 'models/bike'], (Backbone, Bike) ->
  class BikesCollection extends Backbone.Collection
    model: Bike