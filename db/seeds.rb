# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "borrando seeds"
Dish.destroy_all
User.destroy_all
p "creando seeds"
chef1 = User.create!(email: "cmanuferre2@gmail.com", first_name: "manuel", last_name: "ferrer",
  bio: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat distinctio ad obcaecati eaque voluptatibus adipisci nostrum laudantium sit dolor. Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem." , address: "lopez 565", phone_number: 12312312, chef: true, password: "123456")
dish2 = Dish.create!(title: "pollo", description: "muy rico", price: 123123, category: "peruana", chef: chef1)
dish2 = Dish.create!(title: "pollo", description: "muy rico", price: 123123, category: "peruana", chef: chef1)
dish3 = Dish.create!(title: "pollo", description: "muy rico", price: 123123, category: "peruana", chef: chef1)


user1 = User.create!(email: "cmanuferre3@gmail.com", first_name: "carlos", last_name: "ferrer",
  bio: "lkasdasdasd", address: "lopez 565", phone_number: 12312312, chef: false, password: "123456")
