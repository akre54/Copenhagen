define [
  'jquery',
  'views/base/view',
  'views/pages/checkouts_new',
  'bootstrap-modal'
], ($, View, NewCheckoutView) ->
  class BikeRow extends View

    events:
      'click [data-action="create-checkout"]': 'newCheckoutPopup'
      'click [data-action="update-location"]': 'updateLocation'

    newCheckoutPopup: (e) ->
      # setup popup container el
      popupEl = $('#checkout-modal')
      unless popupEl.length
        popupEl = $('<div>').attr
          id: "checkout-modal"
          class: "modal hide fade"
          tabindex: "-1"
          role: "dialog"
          'aria-hidden': "true"
        popupEl.append('<div class="modal-body"></div>')
        $('body').prepend(popupEl)

      # hack the remote option until bootstrap gets their shit together
      popupEl.find('.modal-body').load e.target.href, ->
        new NewCheckoutView el: popupEl

      popupEl.modal('show')

      false

    updateLocation: (e) ->
      location = prompt('enter a new location?')
      false