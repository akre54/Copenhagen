define [
  'views/base/view',
  'views/pages/checkouts_new',
  'views/modules/popup'
], (View, NewCheckoutView, Popup) ->
  class BikeRow extends View

    events:
      'click [data-action="create-checkout"]': 'newCheckoutPopup'
      'click [data-action="update-location"]': 'updateLocation'

    newCheckoutPopup: (e) ->
      popup = new Popup
      popup.load e.target.href, ->
        new NewCheckoutView el: popup.el

      false

    updateLocation: (e) ->
      location = prompt('enter a new location?')
      @model.save('location_id', location)
      false