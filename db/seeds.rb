# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

car1 = Car.create(name: "Mustang", make: "Ford", image: "link", model: "1965", description: "Very cool!")
car2 = Car.create(name: "Camaro", make: "Chevy", image: "link2", model: "1968", description: "Very nice!")
user1 = User.create(username: "Testo")
user2 = User.create(username: "Tetsina")
favorite1 = Favorite.create(user: user1, car: car1)
favorite2 = Favorite.create(user: user1, car: car2)
favorite3 = Favorite.create(user: user2, car: car2)

