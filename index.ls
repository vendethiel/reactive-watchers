pascalize = require 'to-pascal-case'

module.exports = class ReactiveWatchers
  (@model, @fields) ->
  generate: ->
    {["update#{pascalize ..}", @setter ..] for @fields}
  setter: (field) ~>
    ({target: {value}}) !~>
      @model[field] value
      @model.emit "change #field" value 