require 'rails_helper'

RSpec.describe 'createItem', type: :request do
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

    delete_item_mutation =
      <<~GQL
        mutation deleteItem {
            deleteItem(
              input: {
                id: "#{yarn.id}"
                }
            ) {
              success
                }
          }
      GQL

    post '/graphql', params: { query: delete_item_mutation }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:deleteItem]

    expect(data[:success]).to eq(true)
    expect(Item.all.empty?).to be true
  end
end
