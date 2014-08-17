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
    el = ui.item.get(0)
    before = ui.item.prev().get(0)
    after = ui.item.next().get(0)
    newRank = undefined
    unless before # moving to the top of the list
      newRank = share.SimpleRationalRanks.beforeFirst(UI.getElementData(after).rank)
    else unless after # moving to the bottom of the list
      newRank = share.SimpleRationalRanks.afterLast(UI.getElementData(before).rank)
    else
      newRank = share.SimpleRationalRanks.between(UI.getElementData(before).rank, UI.getElementData(after).rank)
    Beers.update UI.getElementData(el)._id,
      $set:
        rank: newRank

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