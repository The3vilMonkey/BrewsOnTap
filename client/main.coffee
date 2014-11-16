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


Meteor.startup ->
    share.setFullscreenMargins()
    $(window).resize (evt) ->
        screenSize = Session.get("device-screensize")
        if screenSize is "small"
            $('body').addClass('mobile')
        else 
            $('body').removeClass('mobile')
    

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
        _.defer ->
            $('.fullscreen #layout_container').css(layoutContainerMargins)
            $('.fullscreen #footer').css(footerPosition)