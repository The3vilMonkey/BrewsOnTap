Template.edit_beverage.editingBeverage = ->
    beverageId = Session.get('editingBeverageId')
    if beverageId?
        return Beverages.findOne({_id : beverageId })

Template.edit_beverage.events
    "click button.form-cancel": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

Template.add_beverage.events
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
