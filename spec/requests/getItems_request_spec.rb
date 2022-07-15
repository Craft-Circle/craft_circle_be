require 'rails_helper'

RSpec.describe 'getItems', type: :request do
  it 'returns all item instances' do
    @bojack = User.create!(name: 'Bojack Horseman', email: 'bjackhman@email.com')

    yarn = Item.create!(
      name: 'Purple Yarn',
      category: 0,
      description: '.8 gauge purple yarn, 1 bundle',
      available: true,
      amount: 1,
      status: 0,
      user_id: @bojack.id
    )
    pencils = Item.create!(
      name: 'Dixon Ticonderoga',
      category: 6,
      description: 'The best pencil known to humankind',
      available: true,
      amount: 1,
      status: 0,
      user_id: @bojack.id
    )
    paper = Item.create!(
      name: 'Multicolored Construction Paper',
      category: 1,
      description: 'THICC paper',
      available: true,
      amount: 5,
      status: 0,
      user_id: @bojack.id
    )
    pottery_wheel = Item.create!(
      name: 'VeryFine Pottery Wheel',
      category: 8,
      description: 'A very fine wheel',
      available: true,
      amount: 1,
      status: 1,
      user_id: @bojack.id
    )
    query =
      <<~GQL
        query {
          getItems {
            id
            name
            description
            available
            category
            status
            user {
              id
              name
            }
          }
        }
      GQL

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:getItems]

    expect(data.count).to eq 4
    expect(data[0][:id]).to eq yarn.id.to_s
    expect(data[3][:status]).to eq 'Borrow'
  end
end
