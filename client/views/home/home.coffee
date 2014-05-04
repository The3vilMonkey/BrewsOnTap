Template.home.events
	"click button.brewery": (evt) ->
		evt.preventDefault()
		href = $(evt.target).attr('href')
		Router.go(href)
    