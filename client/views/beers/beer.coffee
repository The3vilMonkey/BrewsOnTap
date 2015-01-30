Template.beer.helpers
    viewingBeer: ->
        beerId = Session.get('viewingBeerId')
        if beerId
            return Beers.findOne({_id : beerId })

Template.beer.events
    "click .beer i": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

# Template.beer.events(@swipeEvents)
# Template.beer.rendered = @swipeInit

Template.beer.rendered = ->
    _.defer ->
        # $('.swipe').hammer
        #     drag_min_distance:1
        #     swipe_velocity:0.1

        hammer = $(".swipe").hammer()
        hammer.on "swipeleft", (e) ->
            e.stopPropagation()
            console.log "This did just happen."
            return    
    # debugger
    # options =
    #     drag_min_distance:1
    #     swipe_velocity:0.1    
    # swipesurface = document.getElementsByClassName('swipe')
    # hammertime = new Hammer(swipesurface, options)
    # hammertime.on "swipeleft", (ev) ->
    #     console.log ev
    #     return

# Template.beer.events =
#     "swipeleft .swipe": (e, t) ->
#         e.preventDefault()
#         console.log('swipeleft')
#         history.back()
#         return

#     "swiperight .swipe": (e, t) ->
#         e.preventDefault()
#         console.log('swipeleft')
#         history.forward()
#         return