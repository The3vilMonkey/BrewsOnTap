# if 0 # modify if you want some fake data
Meteor.startup ->
#     if Breweries.find().count() is 0
#       breweries = ["Tin Whiskers"]
#       Brew

    if Beers.find().count() is 0
        beers = [

          name: "Short Circuit Stout"
          style: "Sweet Stout"
          description: "A stout beer"
          abv: "6.4%"
          pint_price: "5.00"
          tulip_price: "3.50"
          taster_price: "2.00"
          ontap: false


        ,
          name: "Flipswitch IPA"
          style: "American IPA"
          description: "IPA 4 life"
          abv: "6.7%"
          pint_price: "5.00"
          tulip_price: "3.50"
          taster_price: "2.00"
          ontap: false

        ]
        _.each beers, (beer) ->
            Beers.insert(
                name: beer.name
                style: beer.style
                description: beer.description
                abv: beer.abv
                pint_price: beer.pint_price
                tulip_price: beer.tulip_price
                taster_price: beer.taster_price
                ontap: beer.ontap
            )
