define [
  'jquery',
  'backbone',
  'views/pages/checkouts_new',
  'bootstrap-modal'
], ($, Backbone, NewCheckoutView) ->
  class BikesIndex extends Backbone.View

    el: 'body'

    events:
      'click .js-create-checkout': 'showNewCheckoutPopup'

    showNewCheckoutPopup: (e) ->
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