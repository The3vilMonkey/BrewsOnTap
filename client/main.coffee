UI.registerHelper 'userCanEdit', ->
    loggedInUser = Meteor.user()
    if loggedInUser && Roles.userIsInRole(loggedInUser, ['admin', 'editor'])
        return true
    else
        return false



Meteor.startup ->
    share.setFullscreenMargins()


share.SimpleRationalRanks =
  beforeFirst: (firstRank) ->
    firstRank - 1

  between: (beforeRank, afterRank) ->
    (beforeRank + afterRank) / 2

  afterLast: (lastRank) ->
    lastRank + 1


Template.ontap.rendered = ->
  # uses the 'sortable' interaction from jquery ui
  $("#beers-tbody").sortable stop: (event, ui) -> # fired when an beer is dropped
    $beerTableRows = $("#beers-tbody").children("tr")
    $beerTableRows.each ->
      $beerTableRow = $(this)
      index = $beerTableRow.index()
      rowBeerId = UI.getElementData(this)._id
      existingProps = Beers.findOne(rowBeerId)
      Meteor.call("updateBeerRank", rowBeerId, index)
      # Beers.update(_id : rowBeerId)
        # $set : existingProps
      Beers.update rowBeerId,
        validate: false,
        $set:
          rank: index
    return
  return



share.setFullscreenMargins = ->
    settingsDep.depend()
    settings = Settings.findOne({})
    if settings
        layoutContainerMargins = {
            'margin-top' : settings.screenMarginTop
            'margin-right' : settings.screenMarginRight
            'margin-left' : settings.screenMarginLeft
        }
        footerPosition = {
            'right' : settings.screenMarginRight
            'bottom' : settings.screenMarginBottom
            'left' : settings.screenMarginLeft

        }
        $('.fullscreen #layout_container').css(layoutContainerMargins)
        $('.fullscreen #footer').css(footerPosition)