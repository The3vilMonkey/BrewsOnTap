@Settings = new Meteor.Collection('settings',
  schema:
    screenMarginTop:
      type: Number
      label: "Screen Margin Top (px)"
      min: 0

    screenMarginRight:
      type: Number
      label: "Screen Margin Right (px)"
      min: 0

    screenMarginBottom:
      type: Number
      label: "Screen Margin Bottom (px)"
      min: 0

    screenMarginLeft:
      type: Number
      label: "Screen Margin Left (px)"
      min: 0
)


Settings.allow
  insert: (userId, doc) ->
    throw new Meteor.Error(403, "No insertion of settings")
  update: (userId, entries, fields, modifier) ->
    loggedInUser = Meteor.user()
    if not loggedInUser or not Roles.userIsInRole(loggedInUser,['admin'])
      throw new Meteor.Error(403, "Access denied")
    else
      return true
  remove: (userId, doc) ->
    throw new Meteor.Error(403, "No deletion of settings")