@Beverages = new Mongo.Collection("beverages")
Beverages.attachSchema new SimpleSchema(
  name:
    type: String
    label: "Name"
    max: 100

  description:
    type: String
    max: 500
    label: "Description"

  size:
    type: String
    label: "Size"
    max: 10

  price:
    type: String
    max: 6
    label: "Price"

  isAvailable:
    type: Boolean
    label: "isAvailable?"
)


Beverages.allow
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