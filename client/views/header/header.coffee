Template.header.events
    "click header .navbar a": (evt) ->
        evt.preventDefault()
        $a = $(evt.target).closest('a')
        href = $a.attr('href')
        Router.go(href)

    "click header button": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)


Template.header.AddBeerBtn = () ->
    return Session.get('AddBeerBtn')