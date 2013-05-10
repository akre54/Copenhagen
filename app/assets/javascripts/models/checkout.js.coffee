define ['models/base/model'], (Model) ->
  class Checkout extends Model
    jsonRoot: 'checkout'
    urlRoot: '/checkouts'
