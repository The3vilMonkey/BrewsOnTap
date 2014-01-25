Template.header.events
    "click header .navbar a": (evt) ->
        evt.preventDefault()
        $a = $(evt.target).closest('a')
        href = $a.attr('href')
        Router.go(href)