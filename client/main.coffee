Meteor.startup ->
    share.setFullscreenMargins()
    $(window).resize (evt) ->
        screenSize = Session.get("device-screensize")
        if screenSize is "small"
            $('body').addClass('mobile')
        else 
            $('body').removeClass('mobile')

    swipecontrol = $("body").hammer(
        drag_min_distance:1
        swipe_velocity:0.1
    )
    swipecontrol.on('swipeleft', (evt) ->
        evt.preventDefault()
        console.log('swipe right to left')
        routename = Router.current().route.getName()
        if routename is "root"
            history.forward()
        else if routename is "ontap"
            history.forward()
    )
    swipecontrol.on('swiperight', (evt) ->
        evt.preventDefault()
        console.log('swipe left to right')
        routename = Router.current().route.getName()
        if routename is "beer"
            history.back()
        
    )

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
            #if history.state and history.state.initial is true
                #navigator.app.exitApp()  
        iOS7orGreater = (window.device and 
            window.device.platform and 
            window.device.platform.toLowerCase() == "ios" and 
            parseFloat(window.device.version) >= 7.0);

        if iOS7orGreater 
            $('body').addClass('iOS7plus');



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

# @swipeInit = ->
#     $('.swipe').hammer (
#         drag_min_distance:1
#         swipe_velocity:0.1
#     )

# @swipeEvents =
#     "swipeleft .swipe": (e, t) ->
#         e.preventDefault()
#         history.back()
#         return

#     "swiperight .swipe": (e, t) ->
#         e.preventDefault()
#         history.forward()
#         return

Template.layout.helpers
    transition: ->
        (from, to, element) ->
            route = Router.current().route.getName() 
            if route is 'beer'
                return 'right-to-left'
            else if route is 'root' or route is 'ontap'
                return 'left-to-right'