@Beers = new Mongo.Collection("beers")
Beers.attachSchema new SimpleSchema(
  name:
    type: String
    label: "Name"
    max: 100

  style:
    type: String
    label: "Style"
    max: 50

  stage:
    type: String
    label: "Stage"
    max: 10

  description:
    type: String
    max: 500
    label: "Description"

  abv:
    type: String
    max: 6
    label: "ABV"

  growler_price:
    type: String
    max: 6
    label: "Growler New Price" 

  growler_fill:
    type: String
    max: 6
    label: "Growler Fill Price"

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

  rank:
    type: Number
    label: "Rank"
    min: 0

  SRM:
    type: Number
    label: "SRM"
    decimal: true
    min: 0

  IBU:
    type: Number
    label: "IBUs"
    decimal: true
    min: 0

  OG:
    type: Number
    label: "OG"
    decimal: true
    min: 0

  FG:
    type: Number
    label: "FG"
    decimal: true
    min: 0

  mash_ingredients:
    type: [String]
    label: "Mash Ingredients"

  boil_ingredients:
    type: [String]
    label: "Boil Ingredients"

  fermentation:
    type: [String]
    label: "Fermentation"

)


Beers.allow
  insert: (userId, doc) ->
    loggedInUser = Meteor.user()
    if not loggedInUser or not Roles.userIsInRole(loggedInUser,['admin', 'editor'])
      throw new Meteor.Error(403, "Access denied")
    else
      return true
  update: (userId, entries, fields, modifier) ->
    loggedInUser = Meteor.user()
    if not loggedInUser or not Roles.userIsInRole(loggedInUser,['admin', 'editor'])
      throw new Meteor.Error(403, "Access denied")
    else
      return true
  remove: (userId, doc) ->
    loggedInUser = Meteor.user()
    if not loggedInUser or not Roles.userIsInRole(loggedInUser,['admin', 'editor'])
      throw new Meteor.Error(403, "Access denied")
    else
      return true