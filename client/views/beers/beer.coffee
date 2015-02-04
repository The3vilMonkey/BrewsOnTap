Template.beer.events
    "click .beer i": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)
