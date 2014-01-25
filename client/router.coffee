Router.configure 
  layoutTemplate: "layout"


Router.map ->
  
  ###
  The route's name is "home"
  The route's template is also "home"
  The default action will render the home template
  ###
  @route "home",
    path: "/"
    template: "home"

  
  ###
  The route's name is "posts"
  The route's path is "/posts"
  The route's template is inferred to be "posts"
  ###
  @route "help",
    path: "/help"

  @route "brewery",
    path: "/brewery"