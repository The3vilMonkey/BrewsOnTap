UI.registerHelper 'userCanEdit', ->
    loggedInUser = Meteor.user()
    if loggedInUser && Roles.userIsInRole(loggedInUser, ['admin', 'editor'])
        return true
    else
        return false



Meteor.startup ->
    share.setFullscreenMargins()

share.setFullscreenMargins = ->
    settingsDep.depend()
    settings = Settings.findOne({})
    if settings
        layoutContainerMargins = {
            'margin-top' : settings.screenMarginTop
            'margin-right' : settings.screenMarginRight
            'margin-left' : settings.screenMarginLeft
        }
        footerPosition = {
            'right' : settings.screenMarginRight
            'bottom' : settings.screenMarginBottom
            'left' : settings.screenMarginLeft

        }
        $('.fullscreen #layout_container').css(layoutContainerMargins)
        $('.fullscreen #footer').css(footerPosition)