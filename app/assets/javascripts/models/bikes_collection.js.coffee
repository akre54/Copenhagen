define ['models/base/collection', 'models/bike'], (Collection, Bike) ->
  class BikesCollection extends Collection
    model: Bike
    urlRoot: '/bikes'