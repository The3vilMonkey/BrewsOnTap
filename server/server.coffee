Meteor.publish('breweries', ->
    # Comments.find(query)
    Breweries.find({})
)

Meteor.publish('beers', ->
    # Comments.find(query)
    Beers.find({})
)

Meteor.publish('beverages', ->
    # Comments.find(query)
    Beverages.find({})
)

