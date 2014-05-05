Template.edit_beer.editingBeer = ->
    beerId = Session.get('editingBeerId')
    if beerId
        return Beers.findOne({_id : beerId })
