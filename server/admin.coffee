Meteor.startup ->
    Roles.addUsersToRoles "MxzFWqnYnungE6jz7", ["admin"]  if Meteor.users.findOne("MxzFWqnYnungE6jz7")
    if not Meteor.roles.findOne(name: "editor")
        Roles.createRole "editor" 
    return