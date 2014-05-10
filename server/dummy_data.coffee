# if 0 # modify if you want some fake data
Meteor.startup ->
#     if Breweries.find().count() is 0
#       breweries = ["Tin Whiskers"]
#       Brew

    if Beers.find().count() is 0
        beers = [

          name: "Short Circuit Stout"
          style: "Sweet Stout"
          stage: "Production"
          description: "A stoutly beer"
          abv: "5.3%"
          growler_price: "5.00"
          growler_fill: "14.00"
          pint_price: "5.00"
          tulip_price: "3.50"
          taster_price: "2.00"
          ontap: true
        ,
          name: "Flipswitch IPA"
          style: "American IPA"
          stage: "Production"
          description: "IPA 4 life"
          abv: "6.1%"
          growler_price: "5.00"
          growler_fill: "14.00"
          pint_price: "5.00"
          tulip_price: "3.50"
          taster_price: "2.00"
          ontap: true
        ,
          name: "Wheatstone Bridge"
          style: "American Wheat"
          stage: "Production"
          description: "Wheatstone bridge is the bestest"
          abv: "6.3%"
          growler_price: "5.00"
          growler_fill: "15.00"
          pint_price: "5.00"
          tulip_price: "3.50"
          taster_price: "2.00"
          ontap: true
        ,
          name: "Ampere Amber"
          style: "Amber California Common"
          stage: "Production"
          description: "Its the current that will kill you"
          abv: "4.2%"
          growler_price: "5.00"
          growler_fill: "14.00"
          pint_price: "5.00"
          tulip_price: "3.50"
          taster_price: "2.00"
          ontap: false
        ]
        _.each beers, (beer) ->
            Beers.insert(
                name: beer.name
                style: beer.style
                stage: beer.stage
                description: beer.description
                abv: beer.abv
                growler_price: beer.growler_price
                growler_fill: beer.growler_fill
                pint_price: beer.pint_price
                tulip_price: beer.tulip_price
                taster_price: beer.taster_price
                ontap: beer.ontap
            )
