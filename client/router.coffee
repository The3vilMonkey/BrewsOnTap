
addToolbarButtons = (arrayOfButtons) ->
  for button in arrayOfButtons
    Session.set(button, true)

removeToolbarButtons = (arrayOfButtons) ->
  for button in arrayOfButtons
    Session.set(button, false)

Router.configure 
  layoutTemplate: "layout"

Router.waitOn( ->
  Meteor.subscribe('settings')
)

Router.onAfterAction( ->
  share.setFullscreenMargins()
)

Router.onBeforeAction ->
  # check for ie8 or less (don't support document.addEventListener)
  if @url is '/'
    Session.set('currentPage', 'ontap')
  else
    Session.set('currentPage', @url.split("/")[1])
  this.next()

Meteor.startup ->
  AccountsEntry.config
    homeRoute: "/ontap" # mandatory - path to redirect to after sign-out
    dashboardRoute: "/ontap" # mandatory - path to redirect to after successful sign-in
    passwordSignupFields: "EMAIL_ONLY"

Router.map ->
  @route "home",
    path: "/home"
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
      this.next()
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])

  @route "root",
    path: "/"
    template: "ontap"
    waitOn : -> Meteor.subscribe('beers')
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
      this.next()
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])

  @route "ontap",
    path: "/ontap"
    waitOn : -> Meteor.subscribe('beers')
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
      this.next()
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])

  @route "beer",
    path: "/beer/:id"
    waitOn : -> Meteor.subscribe('beers')
    onBeforeAction: ->
      beerId = this.params.id
      Session.set( 'viewingBeerId' , beerId )
      this.next() 
    onStop: ->
      Session.set( 'viewingBeerId' , false )

  @route "add_beer",
    path: "/add_beer"
    waitOn : -> Meteor.subscribe('beers')

  @route "edit_beer",
    path: "/edit_beer/:id"
    waitOn : -> Meteor.subscribe('beers')
    onBeforeAction: ->
      beerId = this.params.id
      Session.set( 'editingBeerId' , beerId ) 
    onStop: ->
      Session.set( 'editingBeerId' , false )

  @route "settings",
    path: "/settings"
    waitOn : -> Meteor.subscribe('settings')

  @route "beverages",
    path: "/beverages"
    waitOn : Meteor.subscribe('beverages')
    onBeforeAction: ->
      addToolbarButtons(['AddBevBtn'])
      this.next()
    onStop: ->
      removeToolbarButtons(['AddBevBtn'])

  @route "add_beverage",
    path: "/add_beverage"
    waitOn : -> Meteor.subscribe('beverages')

  @route "edit_beverage",
    path: "/edit_beverage/:id"
    waitOn : -> Meteor.subscribe('beverages')
    onBeforeAction: ->
      beverageId = this.params.id
      Session.set( 'editingBeverageId' , beverageId )
      this.next() 
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
      this.next()

  @route "brewery",
    path: "/brewery"
    waitOn : ->
      Meteor.subscribe('breweries')
      Meteor.subscribe('beers')
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
      this.next()
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])
