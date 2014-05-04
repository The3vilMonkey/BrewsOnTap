# if 0 # modify if you want some fake data
Meteor.startup ->
#     if Breweries.find().count() is 0
#       breweries = ["Tin Whiskers"]
#       Brew

    if Beers.find().count() is 0
        beers = [

          name: "Short Circuit Stout"
          style: "Sweet Stout"
          ontap: true
          description: "A stout beer"
        ,
          name: "Flipswitch IPA"
          style: "American IPA"
          ontap: false
          description: "IPA 4 life"
        ]
        _.each beers, (beer) ->
            Beers.insert(
                name: beer.name
                style: beer.style
                ontap: beer.ontap
                description: beer.description
            )
        
