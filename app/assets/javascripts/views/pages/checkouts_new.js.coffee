define [
  'views/base/view',
  'models/bike',
  'models/biker',
  'typeahead'
], (View, Bike, Biker) ->
  class CheckoutsNew extends View

    events:
      'click .btn-confirm': 'createCheckout'

    el: 'body'

    autoRender: true

    render: ->
      @$('#checkout_biker_netid').typeahead
        name: 'bikers'
        valueKey: 'netid'
        prefetch:
          url: '/bikers.json'
          filter: (resp) ->
            for biker in resp
              biker.tokens = biker.full_name.split(' ').concat(biker.netid)
            resp
        template: (data) ->
          "<div class='tt-suggestion'><p>#{data.full_name} <strong>(#{data.netid})</strong></p></div>"

    createCheckout: ->
      attrs = {}
      attrs.biker = new Biker netid: @$('#checkout_biker_netid').val()

      unless @model.has('bike')
        attrs.bike = new Bike id: @$('#checkout_bike_id').val()

      @model.save(attrs).done => @trigger('complete')
      false