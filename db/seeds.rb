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
Review.destroy_all
p "creando seeds"


p "Creando Usuarios"
#  User1
file = URI.open('https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80')
user1 = User.new(email: "cmanuferrer@gmail.com", first_name: "Manuel", last_name: "Ferrer",
  bio: "", address: "", phone_number: 261383119, chef: false, password: "123456")
user1.photo.attach(io: file, filename: 'image1.png', content_type: 'image/png')
user1.save!


# # User2
file = URI.open('https://images.unsplash.com/photo-1628157588553-5eeea00af15c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80')
user2 = User.new(email: "user2@gmail.com", first_name: "Roberto", last_name: "Melaza",
  bio: "", address: "", phone_number: 26178854, chef: false, password: "123456")
user2.photo.attach(io: file, filename: 'image2.png', content_type: 'image/png')
user2.save!


# # User3
file = URI.open('https://images.unsplash.com/photo-1542178243-bc20204b769f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80')
user3 = User.new(email: "user3@gmail.com", first_name: "Nicolás", last_name: "Rodriguez",
  bio: "", address: "", phone_number: 2662555, chef: false, password: "123456")
user3.photo.attach(io: file, filename: 'image3.png', content_type: 'image/png')
user3.save!

p "Creando Chefs"
# Chef1
file = URI.open('https://images.unsplash.com/photo-1595273670150-bd0c3c392e46?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1087&q=80')
chef1 = User.new(email: "maximiliano@gmail.com", first_name: "Maximiliano", last_name: "Brenner",
  bio: "John ha trabajado en el campo de las artes culinarias en Maine, New Hampshire y Massachusetts durante los últimos 39 años y ha perfeccionado sus habilidades en muchos establecimientos de alta cocina durante ese tiempo. Comenzó en el área de York, Maine, trabajando en Stage Neck Inn, York Harbor Inn y Arrows Restaurant y desde allí pasó una década como jefe de panadería en Café Brioche en Portsmouth.", address: "Rio Negro 70, Barrio bombal, Mendoza, Argentina", phone_number: 2613831, chef: true, password: "123456")
chef1.photo.attach(io: file, filename: 'chef1.png', content_type: 'image/png')
chef1.save!

# Chef2
file = URI.open('https://images.unsplash.com/photo-1600565193348-f74bd3c7ccdf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')
chef2 = User.new(email: "ruben@gmail.com", first_name: "Ruben", last_name: "Ferrer",
  bio: "Con su enfoque en la agricultura orgánica, la cocina de la granja a la mesa y la carnicería, Brent finalmente se mudó a Portsmouth, New Hampshire, para ser el chef ejecutivo de The Green Monkey y el chef ejecutivo consultor para la apertura de dos restaurantes en Dover, New Hampshire." , address: "Hilario Cuadros 38, Godoy Cruz, Mendoza, Argentina", phone_number: 2613445, chef: true, password: "123456")
chef2.photo.attach(io: file, filename: 'chef2.png', content_type: 'image/png')
chef2.save!

# Chef3
file = URI.open('https://images.unsplash.com/photo-1601341348280-550b5e87281b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
chef3 = User.new(email: "christine@gmail.com", first_name: "Christine", last_name: "Stewart",
  bio: "Con su enfoque en la agricultura orgánica, la cocina de la granja a la mesa y la carnicería, Brent finalmente se mudó a Portsmouth, New Hampshire, para ser el chef ejecutivo de The Green Monkey y el chef ejecutivo consultor para la apertura de dos restaurantes en Dover, New Hampshire." , address: "Jose Ingenieros 139, Godoy Cruz, Mendoza, Argentina", phone_number: 265444, chef: true, password: "123456")
chef3.photo.attach(io: file, filename: 'chef3.png', content_type: 'image/png')
chef3.save!

# Chef4
file = URI.open('https://images.unsplash.com/photo-1502364271109-0a9a75a2a9df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
chef4 = User.new(email: "chris@gmail.com", first_name: "Chris", last_name: "Toy",
  bio: "Chris ha estado enseñando técnicas de cocina asiática en el sur y la costa central de Maine durante 30 años. Maestro y director jubilado, aprendió a cocinar en la cocina de sus padres y desde entonces se ha convertido en un experto en combinar platos del Lejano Oriente con ofertas locales para crear una sabrosa cocina de fusión." , address: "Lopez 565, Lujan de cuyo, Mendoza, Argentina", phone_number: 261355668, chef: true, password: "123456")
chef4.photo.attach(io: file, filename: 'chef4.png', content_type: 'image/png')
chef4.save!

p "Creando Platos"
# Dish1
pollo = Dish.create!(title: "Pollo grillado", description: "El pollo asado, rostizado, en brasas o a la brasa es un plato genérico elaborado con un pollo expuesto directamente al fuego, que puede provenir de un hogar casero, hasta el asador profesional rotatorio.", price: 1500, category: "italiana", chef: chef1)

pollo_images = [{
  url: "https://images.unsplash.com/photo-1626202378343-1e8b2a828a78?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
  filename: "pollo1.jpeg"
  },
  {
  url: "https://images.unsplash.com/photo-1625944228741-cf30983ecb91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=881&q=80",
  filename: "pollo2.jpeg"
  }]

pollo_images.each do |pollo_info|
  pollo.photos.attach(io: URI.open(pollo_info[:url]), filename: pollo_info[:filename], content_type: "image/jpeg")
end
pollo.save!

# Dish2
carne = Dish.create!(title: "Carne al disco", description: "El asado a la plancha o sartén es una técnica de cocción en la que aplicamos calor seco directo al alimento a una temperatura entre 80 y 260 °C, y donde el calor proviene de un fogón de gas o vitrocerámica (es decir, por conducción).", price: 1850, category: "mexicana", chef: chef2)

carne_images = [{
  url: "https://images.unsplash.com/photo-1603134522163-386e0ebd4049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
  filename: "carne1.jpeg"
  },
  {
  url: "https://images.unsplash.com/photo-1583777303692-a1ce32c26251?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
  filename: "carne2.jpeg"
  }]

carne_images.each do |carne_info|
  carne.photos.attach(io: URI.open(carne_info[:url]), filename: carne_info[:filename], content_type: "image/jpeg")
end
carne.save!


# Dish3 sdfsdfs
choclo = Dish.create!(title: "Tarta de choclo", description: "La teoría atrás de la choclo es primero decidir que tipo de masa queremos, por una parte podemos usar el crujiente y aireado hojaldre.", price: 1600, category: "peruana", chef: chef3)

choclo_images = [{
  url: "https://images.unsplash.com/photo-1567460074231-1e038921a459?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
  filename: "choclo1.jpeg"
  },
  {
  url: "https://images.unsplash.com/photo-1572383672419-ab35444a6934?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
  filename: "choclo2.jpeg"
  }]

choclo_images.each do |choclo_info|
  choclo.photos.attach(io: URI.open(choclo_info[:url]), filename: choclo_info[:filename], content_type: "image/jpeg")
end
choclo.save!

# Dish4
fish = Dish.create!(title: "Salmón al ajillo", description: "Tengo debilidad por el salmón fresco y son muchas las veces que lo hago en casa para comer, para cenar. Vais a descubrir preparaciones que os harán amar este pescado.", price: 2300, category: "americana", chef: chef4)

fish_images = [{
  url: "https://images.unsplash.com/photo-1567460074231-1e038921a459?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
  filename: "fish1.jpeg"
  },
  {
  url: "https://images.unsplash.com/photo-1567460074026-7a610d9f082f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
  filename: "fish2.jpeg"
  }]

fish_images.each do |fish_info|
  fish.photos.attach(io: URI.open(fish_info[:url]), filename: fish_info[:filename], content_type: "image/jpeg")
end
fish.save!







p "Creando reservaciones"
reservation1 = Reservation.create!(user: user1, chef_id: chef1.id, reservation_date: '07/02/2022', observations: 'Lunes por la tarde te llamo y coordinamos')
reservation2 = Reservation.create!(user: user2, chef_id: chef1.id, reservation_date: '07/02/2022', observations: 'Buenisimo, nos vemos el sábado')
reservation3 = Reservation.create!(user: user2, chef_id: chef2.id, reservation_date: '07/02/2022', observations: 'Genial, el martes te llamo para coordinar')
reservation4 = Reservation.create!(user: user2, chef_id: chef3.id, reservation_date: '07/02/2022', observations: 'Estupendo, te comento que tengo un horno de restaurant, por si te sirve')
reservation5 = Reservation.create!(user: user3, chef_id: chef4.id, reservation_date: '07/02/2022', observations: 'Si puedes llámame asi coordinamos')
reservation6 = Reservation.create!(user: user3, chef_id: chef1.id, reservation_date: '07/02/2022', observations: 'Te escribo el viernes')
reservation7 = Reservation.create!(user: user1, chef_id: chef3.id, reservation_date: '07/02/2022', observations: 'Necesitas algo de mi parte, avisame a mi correo')
reservation8 = Reservation.create!(user: user2, chef_id: chef4.id, reservation_date: '07/02/2022', observations: 'Nos vemos, gracias')
reservation9 = Reservation.create!(user: user3, chef_id: chef4.id, reservation_date: '07/02/2022', observations: 'Te esperamos en casa, saludos')
reservation10 = Reservation.create!(user: user3, chef_id: chef1.id, reservation_date: '07/02/2022', observations: 'Las bebidas pueden incluirse?, gracias')

p "Creando platos seleccionados"
# chef1
selected1 = SelectedDish.create(reservation_id: 1, dish_id: 1)
selected2 = SelectedDish.create(reservation_id: 1, dish_id: 5)
# chef 2
selected3 = SelectedDish.create(reservation_id: 2, dish_id: 5)
#  chef 3
selected4 = SelectedDish.create(reservation_id: 3, dish_id: 2)
#  chef 4
selected5 = SelectedDish.create(reservation_id: 4, dish_id: 3)

selected6 = SelectedDish.create(reservation_id: 5, dish_id: 4)

selected7 = SelectedDish.create(reservation_id: 6, dish_id: 1)

selected8 = SelectedDish.create(reservation_id: 7, dish_id: 3)
selected9 = SelectedDish.create(reservation_id: 8, dish_id: 4)
selected10 = SelectedDish.create(reservation_id: 9, dish_id: 4)
selected11 = SelectedDish.create(reservation_id: 10, dish_id: 5)

p "Creando Reviews"
review1 = Review.create!(rating: 4, user: user1, chef_id: chef4.id, comment: "Excelente chef, y deliciosa comida")
review2 = Review.create!(rating: 5, user: user2, chef_id: chef1.id, comment: "Todo de 10, muy recomendable")
review3 = Review.create!(rating: 5, user: user2, chef_id: chef3.id, comment: "La comida exelente, y un 10 de persona")
review4 = Review.create!(rating: 5, user: user3, chef_id: chef4.id, comment: "Muy recomendable")
review5 = Review.create!(rating: 4, user: user1, chef_id: chef4.id, comment: "Sobrepaso mis espectativas")
review6 = Review.create!(rating: 5, user: user2, chef_id: chef1.id, comment: "Tremenda noche nos hizo pasar, 100 puntos")
review7 = Review.create!(rating: 4, user: user2, chef_id: chef2.id, comment: "Muy pero muy lindo todo, la comida exquisita")
review8 = Review.create!(rating: 5, user: user1, chef_id: chef3.id, comment: "Ya lo llame 5  veces y siempre cumplió todo")
