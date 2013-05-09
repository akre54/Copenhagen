define [
  'jquery',
  'views/base/view',
  'views/pages/checkouts_new',
  'views/modules/popup'
], ($, View, NewCheckoutView, Popup) ->
  class BikesIndex extends View
    el: 'body'

    # should transition to a collectionview when we go client-side
    events:
      'click [data-action="create-checkout"]': 'newCheckoutPopup'
      'click [data-action="update-location"]': 'updateLocation'

    newCheckoutPopup: (e) ->
      popup = new Popup
      popup.load e.target.href, =>
        new NewCheckoutView {@el}

      false

    updateLocation: (e) ->
      location = prompt('enter a new location?')
      false