
addToolbarButtons = (arrayOfButtons) ->
  for button in arrayOfButtons
    Session.set(button, true)

removeToolbarButtons = (arrayOfButtons) ->
  for button in arrayOfButtons
    Session.set(button, false)

Router.configure 
  layoutTemplate: "layout"
  loadingTemplate: "loading"

Router.waitOn( ->
  subs.subscribe('settings')
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

# for use with Subscription Manager
#https://atmospherejs.com/meteorhacks/subs-manager
subs = new SubsManager()

Router.map ->
  @route "home",
    path: "/home"
    fastRender: true
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
      this.next()
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])

  # @route "root",
  #   path: "/"
  #   template: "ontap"
  #   waitOn : -> subs.subscribe('beers')
  #   onBeforeAction: ->
  #     addToolbarButtons(['AddBeerBtn'])
  #     document.location.replace("/ontap")
  #     @next()
  #     # @redirect("/ontap")
  #   onStop: ->
  #     removeToolbarButtons(['AddBeerBtn'])

  @route "root",
    path: "/"
    fastRender: true
    template: "ontap"
    waitOn : -> subs.subscribe('beers')
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
      @next()
    data : ->
      beers = Beers.find({}, 
        sort:
          ontap: -1
          rank: 1
      )
    action : ->
      screenSize = Session.get("device-screensize")
      if screenSize is "xs"
        @render("ontapMobile")
        @render("header_sm", {to: "header"})
      else
        @render("ontap")
        @render("header_lrg", {to: "header"})
        @render("admin_menu", {to: "admin_menu"})
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])

  @route "ontap",
    path: "/ontap"
    fastRender: true
    waitOn : -> subs.subscribe('beers')
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
      @next()
    data : ->
      beers = Beers.find({}, 
        sort:
          ontap: -1
          rank: 1
      )
    action : ->
      screenSize = Session.get("device-screensize")
      if screenSize is "xs"
        @render("ontapMobile")
        @render("header_sm", {to: "header"})
      else
        @render("ontap")
        @render("header_lrg", {to: "header"})
        @render("admin_menu", {to: "admin_menu"})
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])

  @route "beer",
    path: "/beer/:id"
    waitOn : -> subs.subscribe('beers')
    data: ->
      beer = Beers.findOne({_id : this.params.id })
    action: ->
      screenSize = Session.get("device-screensize")
      if screenSize is "xs"
        @render("header_sm", {to: "header"})
      else
        @render("header_lrg", {to: "header"})
        @render("admin_menu", {to: "admin_menu"})
      @render("beer")
    onStop: ->
      Session.set( 'viewingBeerId' , false )

  @route "addBeer",
    path: "/addBeer"
    waitOn : -> subs.subscribe('beers')

  @route "editBeer",
    path: "/editBeer/:id"
    waitOn : -> subs.subscribe('beers')
    onBeforeAction: ->
      beerId = this.params.id
      Session.set( 'editingBeerId' , beerId )
      this.next()
    onStop: ->
      Session.set( 'editingBeerId' , false )

  @route "settings",
    path: "/settings"
    waitOn : -> subs.subscribe('settings')

  @route "beverages",
    path: "/beverages"
    waitOn : -> subs.subscribe('beverages')
    onBeforeAction: ->
      addToolbarButtons(['AddBevBtn'])
      this.next()
    onStop: ->
      removeToolbarButtons(['AddBevBtn'])

  @route "addBeverage",
    path: "/addBeverage"
    waitOn : -> subs.subscribe('beverages')

  @route "editBeverage",
    path: "/editBeverage/:id"
    waitOn : -> subs.subscribe('beverages')
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
      subs.subscribe('breweries')
      subs.subscribe('beers')
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
      this.next()
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])

  @route "privacypolicy",
    path: "/privacypolicy"
    onBeforeAction: ->
      addToolbarButtons(['AddBeerBtn'])
      this.next()
    action : ->
      screenSize = Session.get("device-screensize")
      if screenSize is "small"
        @render("header_sm", {to: "header"})
        @render("privacypolicy")
      else
        @render("header_lrg", {to: "header"})
        @render("privacypolicy")
    onStop: ->
      removeToolbarButtons(['AddBeerBtn'])