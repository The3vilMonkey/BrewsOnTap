Template.editBeverage.editingBeverage = ->
    beverageId = Session.get('editingBeverageId')
    if beverageId?
        return Beverages.findOne({_id : beverageId })

Template.editBeverage.events
    "click button.form-cancel": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

Template.addBeverage.events
    "click button.form-cancel": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)


AutoForm.addHooks [
    "updateBeverageForm"
    "insertBeverageForm"
],
    onSuccess: () ->
        Router.go('/beverages')
