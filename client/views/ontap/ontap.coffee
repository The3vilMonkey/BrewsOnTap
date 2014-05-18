Template.ontap.beers = () ->
    Beers.find({}, 
        sort: 
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
        toggleFullScreen()