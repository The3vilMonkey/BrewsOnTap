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