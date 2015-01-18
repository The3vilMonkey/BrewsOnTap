
if Meteor.isClient
  Meteor.startup ->
    Session.set "device-screensize", "xs" if window.matchMedia("only screen and (min-width: 1px) and (max-width: 767px)").matches
    window.matchMedia("only screen and (min-width: 1px) and (max-width: 767px)").addListener (screensize) ->
      if screensize.matches
        Session.set "device-screensize", "xs"
        return

    Session.set "device-screensize", "sm" if window.matchMedia("only screen and (min-width: 768px) and (max-width: 991px)").matches
    window.matchMedia("only screen and (min-width: 768px) and (max-width: 991px)").addListener (screensize) ->
      if screensize.matches
        Session.set "device-screensize", "sm"
        return

    Session.set "device-screensize", "md" if window.matchMedia("only screen and (min-width: 992px) and (max-width: 1199px)").matches
    window.matchMedia("only screen and (min-width: 992px) and (max-width: 1199px)").addListener (screensize) ->
      if screensize.matches
        Session.set "device-screensize", "md"
        return

    # Session.set "device-screensize", "lg" if window.matchMedia("only screen and (min-width: 1441px) and (max-width: 1919px)").matches  
    # window.matchMedia("only screen and (min-width: 1441px) and (max-width: 1919px)").addListener (screensize) ->
    #   if screensize.matches
    #     Session.set "device-screensize", "lg"
    #     return

    Session.set "device-screensize", "lg" if window.matchMedia("only screen and (min-width: 1200px)").matches 
    window.matchMedia("only screen and (min-width: 1200px)").addListener (screensize) ->
      if screensize.matches
        Session.set "device-screensize", "lg"
        return

    if window.matchMedia("only screen and (orientation: portrait)").matches
      Session.set "device-orientation", "portrait"
    else
        # The device is currently in landscape orientation 
      Session.set "device-orientation", "landscape"
    window.matchMedia("only screen and (orientation: portrait)").addListener (orientation) ->
      if orientation.matches    
        # The device is currently in portrait orientation 
        Session.set "device-orientation","portrait"
      else
        # The device is currently in landscape orientation 
        Session.set "device-orientation","landscape"
      return

    retina = "only screen and (-webkit-min-device-pixel-ratio: 2)," + "only screen and (min--moz-device-pixel-ratio: 2)," + "only screen and (-o-min-device-pixel-ratio: 2/1)," + "only screen and (min-device-pixel-ratio: 2)," + "only screen and (min-resolution: 192dpi)," + "only screen and (min-resolution: 2dppx)"
    if window.matchMedia(retina).matches
      Session.set "device-retina", true
    else
        # The device is currently in landscape orientation 
      Session.set "device-retina", false


    Template.registerHelper "screensize", ->
      Session.get "device-screensize"

    Template.registerHelper "screensize_xsmall", ->
      (Session.get "device-screensize") is "xs"

    Template.registerHelper "screensize_small", ->
      (Session.get "device-screensize") is "sm"

    Template.registerHelper "screensize_medium", ->
      (Session.get "device-screensize") is "md"

    Template.registerHelper "screensize_large", ->
      (Session.get "device-screensize") is "lg"

    Template.registerHelper "screensize_xlarge", ->
      (Session.get "device-screensize") is "xl"

    Template.registerHelper "screensize_xxlarge", ->
      (Session.get "device-screensize") is "xxl"


    Template.registerHelper "orientation", ->
      Session.get "device-orientation"

    Template.registerHelper "retina", ->
      Session.get "device-retina"

    Template.registerHelper "portrait", ->
      (Session.get "device-orientation") is "portrait"   

    Template.registerHelper "landscape", ->
      (Session.get "device-orientation") is "landscape"     
  return