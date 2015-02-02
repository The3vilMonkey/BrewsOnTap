# Template.ontap.beers = () ->
#     Beers.find({}, 
#         sort:
#             ontap: -1
#             rank: 1
#     )

Template.ontap.helpers
    show: (ontap) ->
        if not ontap
            return "hidden-fullscreen"

Template.ontap.rendered = ->
  # uses the 'sortable' interaction from jquery ui
  $("#beers-tbody").sortable stop: (event, ui) -> # fired when an beer is dropped
    _.defer ->
      $beerTableRows = $("#beers-tbody").children("tr")
      $beerTableRows.each ->
        $beerTableRow = $(this)
        index = $beerTableRow.index()
        rowBeerId = UI.getElementData(this)._id
        existingProps = Beers.findOne(rowBeerId)
        Meteor.call("updateBeerRank", rowBeerId, index)
        # Beers.update(_id : rowBeerId)
          # $set : existingProps
        # Beers.update rowBeerId,
        #   validate: false,
        #   $set:
        #     rank: index
      return
  share.footerActive(false)

    
Template.ontap.events
    "click button.edit": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

    "click button.print": (evt) ->
        $("html").addClass("print");

    "click #beers-tbody .name, 
     click #beers-tbody .ontap-icon,
     click #beers-tbody .style": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)

# Template.ontap.events(@swipeEvents)
# Template.ontap.rendered = @swipeInit



toggleFullScreen = ->
    # alternative standard method
    if not document.fullscreenElement and not document.mozFullScreenElement and not document.webkitFullscreenElement and not document.msFullscreenElement # current working methods
        if document.documentElement.requestFullscreen
            document.documentElement.requestFullscreen()
        else if document.documentElement.msRequestFullscreen
            document.documentElement.msRequestFullscreen()
        else if document.documentElement.mozRequestFullScreen
            document.documentElement.mozRequestFullScreen()
        else if document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT)
            document.documentElement.webkitRequestFullscreen
    else
        if document.exitFullscreen
            document.exitFullscreen()
        else if document.msExitFullscreen
            document.msExitFullscreen()
        else if document.mozCancelFullScreen
            document.mozCancelFullScreen()
        else if document.webkitExitFullscreen()  
            document.webkitExitFullscreen
    return