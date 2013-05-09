define [
  'views/base/view',
  'views/pages/checkouts_new',
  'views/modules/popup'
], (View, NewCheckoutView, Popup) ->
  class BikeRow extends View

    events:
      'click [data-action="create-checkout"]': 'newCheckoutPopup'
      'click [data-action="update-location"]': 'updateLocation'
      'click [data-action="take-offline"]': 'takeOffline'
      'click [data-action="bring-online"]': 'bringOnline'

    newCheckoutPopup: (e) ->
      popup = new Popup
      popup.load e.target.href, ->
        new NewCheckoutView el: popup.el

      false

    updateLocation: ->
      location = prompt('enter a new location?')
      @model.save('location_id', location)
      false

    takeOffline: ->
      if confirm('are you sure?')
        @model.save('offline', true)
      false

    bringOnline: ->
      if confirm('are you sure?')
        @model.save('offline', false)
      false