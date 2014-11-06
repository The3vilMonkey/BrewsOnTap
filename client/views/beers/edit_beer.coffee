Template.editBeer.editingBeer = ->
    beerId = Session.get('editingBeerId')
    if beerId
        return Beers.findOne({_id : beerId })

Template.editBeer.events
    "click button.form-cancel": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

Template.addBeer.events
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
