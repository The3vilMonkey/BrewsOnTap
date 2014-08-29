Meteor.publish('breweries', ->
    Breweries.find({})
)

Meteor.publish('beers', ->
    Beers.find({})
)

Meteor.publish('beverages', ->
    Beverages.find({})
)

Meteor.publish('settings', ->
    Settings.find({})
)


Meteor.methods
    updateBeerRank: (userId, rowBeerId, index) ->
        if Roles.userIsInRole(Meteor.user(), ["admin"])
            console.log("admin and updating")
            Beers.update rowBeerId,
                validate: false,
                $set:
                    rank: index
