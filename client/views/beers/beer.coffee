Template.beer.viewingBeer = ->
    beerId = Session.get('viewingBeerId')
    if beerId
        return Beers.findOne({_id : beerId })