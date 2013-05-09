define ['chaplin'], (Chaplin) ->
  class BaseModel extends Chaplin.Model

    # the json key of the req to / response from server
    jsonRoot: null

    parse: (resp) ->
      resp = resp[@jsonRoot] if _.has(resp, @jsonRoot)
      resp

    toJSON: ->
      attrs = {}
      attrs[@jsonRoot] = _.clone(@attributes)
      attrs
