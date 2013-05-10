define ['chaplin', 'underscore'], (Chaplin, _) ->
  class BaseModel extends Chaplin.Model

    # the json key of the req to / response from server
    jsonRoot: null

    parse: (resp) ->
      resp = resp[@jsonRoot] if _.has(resp, @jsonRoot)
      resp

    toJSON: ->
      attrs = {}
      attrs[@jsonRoot] = @serialize()
      attrs
