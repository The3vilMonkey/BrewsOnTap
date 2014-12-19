Blaze.registerHelper 'userCanEdit', ->
    loggedInUser = Meteor.user()
    if loggedInUser && Roles.userIsInRole(loggedInUser, ['admin', 'editor'])
        return true
    else
        return false

Blaze.registerHelper 'currentPageIs', (page) ->
    currentPage = Session.get('currentPage')
    if page == currentPage
        return true
    else
        return false