require 'factory_bot_rails'

Item.destroy_all
User.destroy_all

users = FactoryBot.create_list(:user, 10)

users.each do |user|
  FactoryBot.create_list(:item, 5, { user_id: user.id })
end

# phillip = User.create!(name: 'Phillip', email: 'phillip@email.com')
# sandisz = User.create!(name: 'Sandisz', email: 'sandisz@email.com')
# sherman = User.create!(name: 'Sherman', email: 'sherman@email.com')

# yarn = Item.create!(
#   name: 'Purple Yarn',
#   category: 0,
#   description: '.8 gauge purple yarn, 1 bundle',
#   available: 1,
#   amount: 1,
#   status: 0,
#   user_id: phillip.id
# )
# pencils = Item.create!(
#   name: 'Dixon Ticonderoga',
#   category: 6,
#   description: 'The best pencil known to humankind',
#   available: 1,
#   amount: 1,
#   status: 0,
#   user_id: phillip.id
# )
# paper = Item.create!(
#   name: 'Multicolored Construction Paper',
#   category: 1,
#   description: 'THICC paper',
#   available: 1,
#   amount: 5,
#   status: 0,
#   user_id: sandisz.id
# )
# pottery_wheel = Item.create!(
#   name: 'VeryFine Pottery Wheel',
#   category: 8,
#   description: 'A very fine wheel',
#   available: 1,
#   amount: 1,
#   status: 1,
#   user_id: sandisz.id
# )
# oil_paints = Item.create!(
#   name: 'Oil Paint Set',
#   category: 5,
#   description: 'Full-spectrum CBD paint',
#   available: 1,
#   amount: 1,
#   status: 2,
#   user_id: sherman.id
# )
# whittling_knife = Item.create!(
#   name: 'Ol Shermans Whittler',
#   category: 7,
#   description: 'The preferred whittling knife of ol Sherman',
#   available: 0,
#   amount: 1,
#   status: 1,
#   user_id: sherman.id
# )
