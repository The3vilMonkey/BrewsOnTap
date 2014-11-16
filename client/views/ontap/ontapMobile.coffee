Template.ontapMobile.events
    "click .beer": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        if not href
            href = $(evt.target).closest('[href]').attr('href')
        Router.go(href)


