@Breweries = new Meteor.Collection('breweries')

Breweries.allow
  insert: (userId, doc) ->
    true
  update: (userId, entries, fields, modifier) ->
    true
  remove: (userId, doc) ->
    true

@Beers = new Meteor.Collection('beers',
  schema:
    name:
      type: String
      label: "Name"
      max: 100

    style:
      type: String
      label: "Style"
      max: 50

    description:
      type: String
      max: 500
      label: "Description"

    abv:
      type: String
      max: 6
      label: "ABV"

    pint_price:
      type: String
      max: 6
      label: "Print Price"

    tulip_price:
      type: String
      max: 6
      label: "Tulip Price"

    taster_price:
      type: String
      max: 6
      label: "Taster Price"

    ontap:
      type: Boolean
      label: "Ontap"
)


Beers.allow
  insert: (userId, doc) ->
    true
  update: (userId, entries, fields, modifier) ->
    true
  remove: (userId, doc) ->
    true