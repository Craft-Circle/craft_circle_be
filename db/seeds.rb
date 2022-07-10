# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

phillip = User.create!(name: 'Phillip', email: 'phillip@email.com')
sandisz = User.create!(name: 'Sandisz', email: 'sandisz@email.com')
sherman = User.create!(name: 'Sherman', email: 'sherman@email.com')

yarn = Item.create!(
  name: 'Purple Yarn',
  category: 0,
  description: '.8 gauge purple yarn, 1 bundle',
  available: true,
  amount: 1,
  status: 0,
  user_id: phillip.id
)
pencils = Item.create!(
  name: 'Dixon Ticonderoga',
  category: 6,
  description: 'The best pencil known to humankind',
  available: true,
  amount: 1,
  status: 0,
  user_id: phillip.id
)
paper = Item.create!(
  name: 'Multicolored Construction Paper',
  category: 1,
  description: 'THICC paper',
  available: true,
  amount: 5,
  status: 0,
  user_id: sandisz.id
)
pottery_wheel = Item.create!(
  name: 'VeryFine Pottery Wheel',
  category: 8,
  description: 'A very fine wheel',
  available: true,
  amount: 1,
  status: 1,
  user_id: sandisz.id
)
oil_paints = Item.create!(
  name: 'Oil Paint Set',
  category: 5,
  description: 'Full-spectrum CBD paint',
  available: true,
  amount: 1,
  status: 2,
  user_id: sherman.id
)
whittling_knife = Item.create!(
  name: 'Ol Shermans Whittler',
  category: 7,
  description: 'The preferred whittling knife of ol Sherman',
  available: true,
  amount: 1,
  status: 1,
  user_id: sherman.id
)
