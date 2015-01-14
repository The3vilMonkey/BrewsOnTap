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
        if Roles.userIsInRole(Meteor.user(), ["editor", "admin"])
            console.log("editor and updating")
            Beers.update rowBeerId,
                $set:
                    rank: index
            ,
                validate: false

    sendNotification: (beer) ->
        if Roles.userIsInRole(Meteor.user(), ["editor", "admin"])
            console.log('push notification')
            title = beer.name + ' is now on tap.'
            Push.send
              from: "Tin Whiskers Brewing"
              title: title
              text: "We've got one waiting for you."
              # badge: 12
              query: {}
