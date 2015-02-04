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
          rank: 1
          SRM: 12.7
          IBU: 100
          OG: "1.28"
          FG: "1.12"
          mash_ingredients: ["malt 1","malt 2"]
          boil_ingredients: ["hops","lactose"]
          fermentation: ["yeast","time"]
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
          rank: 2
          SRM: 12.7
          IBU: 100
          OG: "1.28"
          FG: "1.12"
          mash_ingredients: []
          boil_ingredients: []
          fermentation: []
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
          rank: 3
          SRM: 12.7
          IBU: 100
          OG: "1.28"
          FG: "1.12"
          mash_ingredients: []
          boil_ingredients: []
          fermentation: []
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
          rank: 4
          SRM: 12.7
          IBU: 100
          OG: "1.28"
          FG: "1.12"
          mash_ingredients: []
          boil_ingredients: []
          fermentation: []
        ]
        console.log("Inserting Dummy Data")
        console.log(beers)
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
                rank: beer.rank
                SRM: beer.SRM
                IBU: beer.IBU
                OG: beer.OG
                FG: beer.FG
                mash_ingredients: beer.mash_ingredients
                boil_ingredients: beer.boil_ingredients
                fermentation: beer.fermentation
            )


    if Settings.find().count() is 0
      Settings.insert(
        screenMarginTop: 0
        screenMarginRight: 0
        screenMarginBottom: 0
        screenMarginLeft: 0
      )