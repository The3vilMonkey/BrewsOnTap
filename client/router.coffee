
addToolbarButtons = (arrayOfButtons) ->
  for button in arrayOfButtons
    Session.set(button, true)

removeToolbarButtons = (arrayOfButtons) ->
  for button in arrayOfButtons
    Session.set(button, false)

Router.configure 
  layoutTemplate: "layout"

Router.map ->
  
  @route "home",
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




  @route "beverages",
    path: "/beverages"
    waitOn : Meteor.subscribe('beverages')
    onBeforeAction: ->
      addToolbarButtons(['AddBevBtn'])
    onStop: ->
      removeToolbarButtons(['AddBevBtn'])

  @route "add_beverage",
    path: "/add_beverage"
    waitOn : Meteor.subscribe('beverages')

  @route "edit_beverage",
    path: "/edit_beverage/:id"
    waitOn : Meteor.subscribe('beverages')
    onBeforeAction: ->
      beverageId = this.params.id
      Session.set( 'editingBeverageId' , beverageId ) 
    onStop: ->
      Session.set( 'editingBeverageId' , false )


      

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
