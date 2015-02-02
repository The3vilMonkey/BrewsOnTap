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
