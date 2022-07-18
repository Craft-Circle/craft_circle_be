require 'rails_helper'

RSpec.describe 'editItem', type: :request do
  it 'creates a item' do
    @bojack = User.create!(name: 'Bojack Horseman', email: 'bjackhman@email.com')
    yarn = @bojack.items.create!(
      name: 'Purple Yarn',
      category: 0,
      description: '.8 gauge purple yarn, 1 bundle',
      available: true,
      amount: 1,
      status: 0
    )

    edit_item_mutation =
      <<~GQL
        mutation editItem {
            editItem(
              input: {
                id: "#{yarn.id}"
                name: "Magical Yarn",
                category: 0,
                description: "They're magical!",
                available: true,
                amount: 3,
                status: 1
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

    post '/graphql', params: { query: edit_item_mutation }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:editItem][:item]
    edit_item = Item.find(yarn.id)

    expect(yarn.id.to_s).to eq(data[:id])
    expect(data[:name]).to eq(edit_item.name)
    expect(data[:category]).to eq(edit_item.category)
    expect(data[:available]).to eq(edit_item.available)
    expect(data[:amount]).to eq(edit_item.amount)
    expect(data[:status]).to eq(edit_item.status)
    expect(data[:user][:id]).to eq(@bojack.id.to_s)
    expect(data[:user][:name]).to eq(@bojack.name)
  end
end
