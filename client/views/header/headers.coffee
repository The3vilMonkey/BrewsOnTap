Template.header_lrg.events
    "click .back-btn": ->
        Router.go('ontap')

    "click button.fullscreen-btn": (evt) ->
        evt.preventDefault()
        share.setFullscreenMargins()
        if $("body").hasClass "fullscreen"
            $("body").removeClass "fullscreen"
            $("body").addClass "regscreen"
            share.footerActive(false)
        else
            $("body").addClass "fullscreen"
            $("body").removeClass "regscreen"
            share.footerActive(true)
            $(".fullscreen .fullscreen-btn-col").hover (->
                $(".fullscreen-btn").css("opacity",1)
                return
            ), ->
                $(".fullscreen-btn").css("opacity",0)
                return
        # toggleFullScreen()

Template.header_sm.events
    "click .back-btn": ->
        Router.go('ontap')