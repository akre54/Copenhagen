define ['models/base/collection', 'models/checkout'], (Collection, Checkout) ->
  class CheckoutsCollection extends Collection
    model: Checkout
    url: '/checkouts'