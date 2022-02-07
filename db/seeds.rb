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
Reservation.destroy_all
SelectedDish.destroy_all
p "creando seeds"
user1 = User.create!(email: "cmanuferre3@gmail.com", first_name: "carlos", last_name: "ferrer",
  bio: "lkasdasdasd", address: "lopez 565", phone_number: 12312312, chef: false, password: "123456")

chef1 = User.create!(email: "chef1@gmail.com", first_name: "Marcos", last_name: "ferrer",
  bio: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat distinctio ad obcaecati eaque voluptatibus adipisci nostrum laudantium sit dolor. Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem." , address: "lopez 565", phone_number: 12312312, chef: true, password: "123456")

chef2 = User.create!(email: "chef2@gmail.com", first_name: "Ruben", last_name: "ferrer",
  bio: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat distinctio ad obcaecati eaque voluptatibus adipisci nostrum laudantium sit dolor. Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem." , address: "lopez 565", phone_number: 12312312, chef: true, password: "123456")

dish1 = Dish.create!(title: "Pollo grillado", description: "Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem.", price: 1500, category: "italiana", chef: chef1)
dish2 = Dish.create!(title: "Carne al disco", description: "Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem.", price: 1850, category: "mexicana", chef: chef1)
dish3 = Dish.create!(title: "Tarta de acelga", description: "Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem.", price: 1600, category: "peruana", chef: chef2)
dish4 = Dish.create!(title: "Lasagna", description: "Sunt praesentium cumque reiciendis assumenda aperiam minima laudantium laborum saepe! Exercitationem.", price: 2300, category: "americana", chef: chef2)


reservation1 = Reservation.create!(user_id: 1, chef_id:2, reservation_date: '07/02/2022', observations: 'prueba 1')
reservation2 = Reservation.create!(user_id: 1, chef_id:2, reservation_date: '07/02/2022', observations: 'prueba 2')
reservation3 = Reservation.create!(user_id: 1, chef_id:3, reservation_date: '07/02/2022', observations: 'prueba 3')
