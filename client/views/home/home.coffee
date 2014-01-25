Template.home.events
	"click home .button": (evt) ->
		evt.preventDefault()
		$a = $(evt.target).button
		href = $a.attr('href')
		Router.go(href)
    