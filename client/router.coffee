


addToolbarButtons = (arrayOfButtons) ->
  for button in arrayOfButtons
    Session.set(button, true)

removeToolbarButtons = (arrayOfButtons) ->
  for button in arrayOfButtons
    Session.set(button, false)

Router.configure 
  layoutTemplate: "layout"

Router.map ->
  
  @route "ontap",
    path: "/"
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])

  @route "ontap",
    path: "/ontap"
    waitOn : Meteor.subscribe('beers')
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])

  @route "add_beer",
    path: "/add_beer"
    waitOn : Meteor.subscribe('beers')

  @route "edit_beer",
    path: "/edit_beer/:id"
    waitOn : Meteor.subscribe('beers')
    onBeforeAction: ->
      beerId = this.params.id
      Session.set( 'editingBeerId' , beerId ) 
    onStop: ->
      Session.set( 'editingBeerId' , false )

  @route "admin",
    path: "/admin"
    template: "accountsAdmin"
    onBeforeAction: ->
      if Meteor.loggingIn()
        # @render(@loadingTemplate)
      else if not Roles.userIsInRole(Meteor.user(), ["admin"])
        @redirect("/")
      return


  @route "brewery",
    path: "/brewery"
    waitOn : ->
      Meteor.subscribe('breweries')
      Meteor.subscribe('beers')
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])
