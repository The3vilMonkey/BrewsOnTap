Meteor.publish('breweries', ->
    # Comments.find(query)
    Breweries.find({})
)

Meteor.publish('beers', ->
    # Comments.find(query)
    Beers.find({})
)
