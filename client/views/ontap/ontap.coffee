Template.ontap.beers = () ->
    Beers.find({}, 
        sort:
            ontap: -1
            rank: 1
    )

Template.ontap.show = (ontap) ->
    if not ontap
        return "hidden-fullscreen"

Template.ontap.rendered = ->
  # uses the 'sortable' interaction from jquery ui
  $("#beers-tbody").sortable stop: (event, ui) -> # fired when an beer is dropped
    _.defer ->
      $beerTableRows = $("#beers-tbody").children("tr")
      $beerTableRows.each ->
        $beerTableRow = $(this)
        index = $beerTableRow.index()
        rowBeerId = UI.getElementData(this)._id
        existingProps = Beers.findOne(rowBeerId)
        Meteor.call("updateBeerRank", rowBeerId, index)
        # Beers.update(_id : rowBeerId)
          # $set : existingProps
        # Beers.update rowBeerId,
        #   validate: false,
        #   $set:
        #     rank: index
      return
  footerActive(false)

    

footerActive = (showFooter) ->
    if showFooter is true
        $('#footer').show()
        $('#footer').css('position', 'fixed')
    else
        $('#footer').hide()
        $('#footer').css('position', 'relative')

Template.ontap.events
    "click button.edit": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

    "click button.print": (evt) ->
        $("html").addClass("print");

    "click button.fullscreen-btn": (evt) ->
        evt.preventDefault()
        share.setFullscreenMargins()
        if $("body").hasClass "fullscreen"
            $("body").removeClass "fullscreen"
            $("body").addClass "regscreen"
            footerActive(false)
        else
            $("body").addClass "fullscreen"
            $("body").removeClass "regscreen"
            footerActive(true)
            $(".fullscreen .fullscreen-btn-col").hover (->
                $(".fullscreen-btn").css("opacity",1)
                return
            ), ->
                $(".fullscreen-btn").css("opacity",0)
                return
        # toggleFullScreen()

    "click #beers-tbody .name, 
     click #beers-tbody .ontap-icon,
     click #beers-tbody .style": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

Meteor.startup ->

    # only works with fullscreenAPI which doesn't work with chromecast

    # $(document).on "fullscreenchange webkitfullscreenchange mozfullscreenchange", (event) -> # 'fullscreenchange' eventlistener from fullscreen API
    #     event.preventDefault()
    #     if $("body").hasClass("fullscreen")
    #         $("body").removeClass "fullscreen"
    #         # Do functions when exiting fullscreen
    #         console.log "Exit Fullscreen"
    #     else
    #         $("body").addClass "fullscreen"
    #         share.setFullscreenMargins()
    #         # Do functions when entering fullscreen
    #         console.log "Enter Fullscreen"
    #     return

    # $(window).on "resize", (event) ->
    #     _.defer ->
    #         # doesn't work in VM
    #         if  (window.innerWidth == screen.width && window.innerHeight == screen.height)
    #             $("body").addClass "fullscreen"
    #             $("body").removeClass "regscreen"
    #             share.setFullscreenMargins()
    #             console.log "Enter Fullscreen"
    #         else    
    #             $("body").removeClass "fullscreen"
    #             $("body").addClass "regscreen"
    #             console.log "Exit Fullscreen"

    # $(document).on "keydown", (event) ->
    #     document.webkitFullScreenKeyboardInputAllowed = true
    #     if event.which is 122 and $("body").hasClass "fullscreen"
    #         $("body").removeClass "fullscreen"
    #         $("body").addClass "regscreen"
    #         share.setFullscreenMargins()
    #     else
    #         $("body").addClass "fullscreen"
    #         $("body").removeClass "regscreen"
            


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