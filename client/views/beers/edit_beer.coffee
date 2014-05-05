Template.edit_beer.editingBeer = ->
    beerId = Session.get('editingBeerId')
    if beerId
        return Beers.findOne({_id : beerId })

Template.edit_beer.events
    "click button.form-cancel": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

Template.add_beer.events
    "click button.form-cancel": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)


AutoForm.addHooks [
    "updateBeerForm"
    "insertBeerForm"
],
    onSuccess: () ->
        Router.go('/ontap')
