define ['views/base/view', 'bootstrap-modal'], (View) ->
  class Popup extends View

    events:
      'click .btn-cancel': 'close'

    autoRender: true
    container: 'body'
    containerMethod: 'prepend'

    attributes:
      id: "checkout-modal"
      class: "modal hide fade"
      tabindex: "-1"
      role: "dialog"
      'aria-hidden': "true"

    render: ->
      @$el.append('<div class="modal-body"></div>')

    load: (href, callback) ->
      @$('.modal-body').load href, =>
        @delegateEvents()
        callback()
      @$el.modal('show')

    close: ->
      @$el.modal('hide')
      @dispose()
      false