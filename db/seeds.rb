# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: "Nightlife")
Category.create(name: "Historic Homes")
Category.create(name: "Museums")
Category.create(name: "Restaurants")
Category.create(name: "Parks")
Category.create(name: "Cemeteries")
Category.create(name: "Points of Interest")
Category.create(name: "Shopping")

Neighborhood.create(name: "French Quarter", description: "The French Quarter is the oldest neighborhood in the city, and comprised the entire city between 1718 and 1788. Despite its name, most of the iconic architecture of this neighborhood is Spanish or American, not French.", image_link: "/frenchquarter.jpg")
Neighborhood.create(name: "Garden District", description: "Formerly the American city of Lafayette, the garden district was home to many wealthy American who came to the city after the Louisiana purchase. It's known for its beautiful architecture and, of course, lovely gardens.", image_link: "/gardendistrict.jpg")
Neighborhood.create(name: "Central Business District", description: "Located just upriver from the French Quarter, the CBD is the heart of downtown New Orleans. Though the neighborhood was incorporated into the city all the way back in 1788, most of the architecture dates to the 20th and 21st centuries.", image_link: "/CBD.jpg")
Neighborhood.create(name: "Marigny", description: "Located downriver from the French Quarter, the Marigny was once known as the 'Poor Third', as its residents were primarily working class. Now, it is one of the most popular (and expensive) neighborhoods in town.", image_link: "/marigny.jpg")
Neighborhood.create(name: "Treme", description: "Just lakeside of the French Quarter, this neighborhood was originally home to many Free People of Color during the early 1800s. It is often called the 'Birthplace of Jazz', because it was home to many early jazz musicians, and because it contains Congo Square.", image_link: "/treme.jpg")

Landmark.create(name: "St. Louis Cathedral", description: "The St. Louis Cathedral is one of the most recognizable buildings in the city of New Orleans. Though the current structure was completely rebuilt in 1850, the site has held a church since the founding of the city in 1718. The landmark achieved the status of cathedral in 1793. St Louis Cathedral still holds regular mass and is a popular location for weddings.", image_link: "/stlouis.jpg", more_info_link: "http://www.stlouiscathedral.org/", neighborhood_id: 1, category_id: 7, address: "800 blk of Chartres")
Landmark.create(name: "Commander's Palace", description: "The crown jewel of the Brennan family of restaurants. Leave your shorts at home - Commander's Palace is old-fashioned and serious about the dress code.", image_link: "/commanderspalace.jpg", more_info_link: "https://www.commanderspalace.com/", neighborhood_id: 2, category_id: 4, address: "1403 Washington Ave")
Landmark.create(name: "Jackson Square", description: "Formerly the Place D'Armes and the Plaza De Armas, this square dates back to the founding of the city, and served as a military drill ground until it was given a facelift in the 1850s, which included a statue of Andrew Jackson, the hero of the Battle of New Orleans.", neighborhood_id: 1, category_id: 5, address: "800 blk of Decatur")
Landmark.create(name: "Louis Armstrong Park", description: "Armstrong park was created in honor of legendary Jazz trumpeter Louis Armstrong, a native New Orleanian. This location was chosen because of its proximity to the historic site of Congo Square - a patch of land on which enslaved people gathered on Sunday afternoons to play drums and celebrate the African culture that had largely been taken from them by the cruel practice of slavery.", image_link: "armstrongpark.jpg", more_info_link: "http://www.neworleansonline.com/directory/location.php?locationID=1341", neighborhood_id: 5, category_id: 5, address: "800 blk of Rampart")
Landmark.create(name: "Lafayette Cemetery #1", description: "Lafayette Cemetery #1 is the first cemetery on the American side of town, opened 1833, almost immediately after the founding of the American city of Lafayette.", image_link: "/lafayette1cemetery", more_info_link: "http://www.saveourcemeteries.org/lafayette-cemetery-no-1/", neighborhood_id: 2, category_id: 6, address: "1416 Washington Ave")