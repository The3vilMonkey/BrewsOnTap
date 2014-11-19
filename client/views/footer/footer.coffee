share.footerActive = (showFooter) ->
    if showFooter is true
        $('#footer').show()
        $('#footer').css('position', 'fixed')
    else
        $('#footer').hide()
        $('#footer').css('position', 'relative')