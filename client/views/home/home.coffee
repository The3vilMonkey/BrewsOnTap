Template.home.events
    "click button": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)