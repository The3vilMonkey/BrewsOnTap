Template.ontap.beers = () ->
    Beers.find({}, 
        sort: 
            rank: 1
            ontap: -1
    )

Template.ontap.show = (ontap) ->
    if not ontap
        return "hidden-fullscreen"

Template.ontap.events
    "click button.edit": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

    "click button.print": (evt) ->
        $("html").addClass("print");

    "click button.fullscreen": (evt) ->
        evt.preventDefault()
        toggleFullScreen()

    "click #beers-tbody .name, 
     click #beers-tbody .ontap-icon,
     click #beers-tbody .style": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

Meteor.startup ->
    $(document).on "fullscreenchange", (event) -> # 'fullscreenchange' eventlistener from fullscreen API
        event.preventDefault()
        if $("body").hasClass("fullscreen")
            $("body").removeClass "fullscreen"

            # Do functions when exiting fullscreen
            console.log "Exit Fullscreen"
        else
            $("body").addClass "fullscreen"
            share.setFullscreenMargins()
            # Do functions when entering fullscreen
            console.log "Enter Fullscreen"
        return

    $(document).on "keydown", (event) ->
        if event.which is 122
            $("body").addClass "fullscreen"
            share.setFullscreenMargins()
            # event.preventDefault()
            # toggleFullScreen() # From fullscreen API
        return

toggleFullScreen = ->
    # alternative standard method
    if not document.fullscreenElement and not document.mozFullScreenElement and not document.webkitFullscreenElement and not document.msFullscreenElement # current working methods
        if document.documentElement.requestFullscreen
            document.documentElement.requestFullscreen()
        else if document.documentElement.msRequestFullscreen
            document.documentElement.msRequestFullscreen()
        else if document.documentElement.mozRequestFullScreen
            document.documentElement.mozRequestFullScreen()
        else if document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT)
            document.documentElement.webkitRequestFullscreen
    else
        if document.exitFullscreen
            document.exitFullscreen()
        else if document.msExitFullscreen
            document.msExitFullscreen()
        else if document.mozCancelFullScreen
            document.mozCancelFullScreen()
        else if document.webkitExitFullscreen()  
            document.webkitExitFullscreen
    return