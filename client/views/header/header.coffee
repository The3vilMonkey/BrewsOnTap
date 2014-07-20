Template.header.events
    "click header .navbar a.navbar-brand": (evt) ->
        evt.preventDefault()
        $a = $(evt.target).closest('a')
        href = $a.attr('href')
        if href
            Router.go(href)

    "click header button": (evt) ->
        evt.preventDefault()
        href = $(evt.target).attr('href')
        Router.go(href)


Template.header.AddBeerBtn = () ->
    return Session.get('AddBeerBtn')

Template.header.AddBevBtn = () ->
    return Session.get('AddBevBtn')