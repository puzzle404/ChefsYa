# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "open-uri"

p "borrando seeds"
User.destroy_all
Dish.destroy_all
Reservation.destroy_all
SelectedDish.destroy_all
p "creando seeds"

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')

user1 = User.new(email: "user1@gmail.com", first_name: "carlos", last_name: "ferrer",
  bio: "lkasdasdasd", address: "Av. Abancay 123", phone_number: 12312312, chef: false, password: "123456")
user1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user1.save!

chef1 = User.new(email: "chef1@gmail.com", first_name: "Marcos", last_name: "ferrer",
  bio: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat distinctio ad obcaecati eaque voluptatibus adipisci nostrum laudantium sit dolor. Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem." , address: "Av. Abancay 123, Lima, Peru", phone_number: 12312312, chef: true, password: "123456")
file = URI.open('https://images.unsplash.com/photo-1577219491135-ce391730fb2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=677&q=80')
chef1.photo.attach(io: file, filename: 'chef1.png', content_type: 'image/png')
chef1.save!


chef2 = User.new(email: "chef2@gmail.com", first_name: "Ruben", last_name: "ferrer",
  bio: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat distinctio ad obcaecati eaque voluptatibus adipisci nostrum laudantium sit dolor. Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem." , address: "Av. Abancay 540, Lima, Peru", phone_number: 12312312, chef: true, password: "123456")
file = URI.open('https://images.unsplash.com/photo-1600565193348-f74bd3c7ccdf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')
chef2.photo.attach(io: file, filename: 'chef2.png', content_type: 'image/png')
chef2.save!


dish1 = Dish.create!(title: "Pollo grillado", description: "Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem.", price: 1500, category: "italiana", chef: chef1)
dish2 = Dish.create!(title: "Carne al disco", description: "Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem.", price: 1850, category: "mexicana", chef: chef1)
dish3 = Dish.create!(title: "Tarta de acelga", description: "Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem.", price: 1600, category: "peruana", chef: chef2)
dish4 = Dish.create!(title: "Lasagna", description: "Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem.", price: 2300, category: "americana", chef: chef2)


reservation1 = Reservation.create!(user_id: 1, chef_id:2, reservation_date: '07/02/2022', observations: 'prueba 1')
reservation2 = Reservation.create!(user_id: 1, chef_id:2, reservation_date: '07/02/2022', observations: 'prueba 2')
reservation3 = Reservation.create!(user_id: 1, chef_id:3, reservation_date: '07/02/2022', observations: 'prueba 3')
