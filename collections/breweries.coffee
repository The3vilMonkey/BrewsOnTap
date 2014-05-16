@Breweries = new Meteor.Collection('breweries')

Breweries.allow
  insert: (userId, doc) ->
    true
  update: (userId, entries, fields, modifier) ->
    true
  remove: (userId, doc) ->
    true
