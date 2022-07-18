require 'rails_helper'

RSpec.describe 'createItem', type: :request do
  it 'creates a item' do
    @bojack = User.create!(name: 'Bojack Horseman', email: 'bjackhman@email.com')
    create_item_mutation =
      <<~GQL
        mutation createItem {
            createItem(
              input: {
                userId: "#{@bojack.id}"
                name: "Magical Chisels",
                category: 7,
                description: "They're magical!",
                available: 1,
                amount: 9,
                status: 0
                }) {
              item {
                id
                name
                category
                description
                available
                amount
                status
                user {
                  id
                  name
                }
              }
            }
          }
      GQL
    post '/graphql', params: { query: create_item_mutation }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:createItem][:item]

    expect(Item.last.id.to_s).to eq(data[:id])
    expect(Item.last.name).to eq('Magical Chisels')
    expect(Item.last.category).to eq('Wood Working')
    expect(Item.last.available).to eq('true')
    expect(Item.last.amount).to eq(9)
    expect(Item.last.status).to eq('Give')
    expect(Item.last.user.id).to eq(@bojack.id)
    expect(Item.last.user.name).to eq('Bojack Horseman')
  end
end
