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
        prevent_default: true
    )
    swipecontrol.on('swipeleft', ->
        console.log('swipeleft')
        history.back()
    )
    swipecontrol.on('swiperight', ->
        console.log('swiperight')
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
            else if route is '/' or route is 'ontap'
                return 'left-to-right'