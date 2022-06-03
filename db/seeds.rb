# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

car1 = Car.create(name: "Vogue", make: "Range Rover", image: "https://d2cnxbg536lf2p.cloudfront.net/test/file_5d14dc974de986_60230467.jpeg", model: "2022", description: "The vehicle will be delivered and collected at no addtional cost. You can specify the exact location - hotel, address or the airport in the next step.")
car2 = Car.create(name: "Benz", make: "Mercedes", image: "https://d2cnxbg536lf2p.cloudfront.net/test/mercedes-benz-s-class_2015_lurento_5dde8498069300_74052328.jpg", model: "2020", description: "The vehicle will be delivered and collected at no addtional cost. You can specify the exact location - hotel, address or the airport in the next step.")
car3 = Car.create(name: "Porshe", make: "Carrera", image: "https://d2cnxbg536lf2p.cloudfront.net/test/file_5be75facde77c5_10045608.jpg", model: "2021", description: "The vehicle will be delivered and collected at no addtional cost. You can specify the exact location - hotel, address or the airport in the next step.")
car4 = Car.create(name: "Audi", make: "A8", image: "https://d2cnxbg536lf2p.cloudfront.net/test/audi-a8_2016_lurento_5ddbe3a3683ad9_84355158.jpg", model: "2022", description: "The vehicle will be delivered and collected at no addtional cost. You can specify the exact location - hotel, address or the airport in the next step.")
car5 = Car.create(name: "Maserati", make: "Levante", image: "https://d2cnxbg536lf2p.cloudfront.net/test/maserati-levante-s-3-0-v6_2019_lurento_5dc96f6de95926_15148197.jpeg", model: "2019", description: "The vehicle will be delivered and collected at no addtional cost. You can specify the exact location - hotel, address or the airport in the next step.")
car6 = Car.create(name: "BMW 7", make: "Series 740", image: "https://d2cnxbg536lf2p.cloudfront.net/test/file_5c438b938bf660_86124239.jpg", model: "2021", description: "The vehicle will be delivered and collected at no addtional cost. You can specify the exact location - hotel, address or the airport in the next step.")
p "Created #{Car.count} Cars"

# user1 = User.create(username: "Testo")
# user2 = User.create(username: "Tetsina")
# favorite1 = Favorite.create(user: user1, car: car1)
# favorite2 = Favorite.create(user: user1, car: car2)
# favorite3 = Favorite.create(user: user2, car: car2)

