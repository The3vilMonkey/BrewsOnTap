Meteor.startup ->
    share.setFullscreenMargins()
    $(window).resize (evt) ->
        screenSize = Session.get("device-screensize")
        if screenSize is "small"
            $('body').addClass('mobile')
        else 
            $('body').removeClass('mobile')

if Meteor.isCordova
    Meteor.startup ->
        document.addEventListener("backbutton", (->
            if document.location.pathname is "/"
                # window.plugins.Suspend.suspendApp()
                navigator.app.exitApp()
            else if document.location.pathname is "/ontap"
                # window.plugins.Suspend.suspendApp()
                navigator.app.exitApp()
            else
                history.go(-1)
        ), false)
    # window.onpopstate = ->
    #     debugger
    #     console.log('popstate')
    #     console.log(history)
    #     console.log(history.state)
    #     console.log(document.location.pathname)
        #if history.state and history.state.initial is true
            #navigator.app.exitApp()  

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

