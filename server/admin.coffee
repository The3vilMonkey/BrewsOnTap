Meteor.startup ->
    if not Meteor.roles.findOne(name: "editor")
        Roles.createRole "editor"

    if Roles.getUsersInRole(['admin']).count() == 0
        userObserverCursor = Meteor.users.find({})
        userObserverCursor.observe
            added: (doc) ->
                if ( userObserverCursor.count() == 1)
                    user = Meteor.users.findOne({})
                    Roles.addUsersToRoles(user._id, ["admin"])
                    console.log('added admin and editor for '+ user._id)
