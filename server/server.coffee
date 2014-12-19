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
    updateBeerRank: (rowBeerId, index) ->
        if Roles.userIsInRole(Meteor.user(), ["admin"])
            console.log("admin and updating")
            Beers.update rowBeerId,
                $set:
                    rank: index
            ,
                validate: false

    sendNotification: (beer) ->
        if Roles.userIsInRole(Meteor.user(), ["admin"])
            Push.send
              from: "Tin Whiskers"
              title: beer.name " is now on tap"
              # text: "World"
              # badge: 12
              # query: {}
