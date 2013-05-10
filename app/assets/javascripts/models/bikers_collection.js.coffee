define ['models/base/collection', 'models/biker'], (Collection, Biker) ->
  class BikersCollection extends Collection
    model: Biker
    url: '/bikers'