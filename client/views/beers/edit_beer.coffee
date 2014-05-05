Template.edit_beer.editingBeer = ->
    beerId = Session.get('editingBeerId')
    if beerId
        return Beers.findOne({_id : beerId })


AutoForm.addHooks [
    "updateBeerForm"
    "insertBeerForm"
],
    onSuccess: () ->
        Router.go('/ontap')
