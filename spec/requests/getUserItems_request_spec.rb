require 'rails_helper'

RSpec.describe 'getUserItems', type: :request do
  it 'returns a users items' do
    susan = User.create!(name: 'Susan', email: 'susan@example.com')
    joseph = User.create!(name: 'Joseph', email: 'joseph@example.com')

    yarn = susan.items.create!(
      name: 'Purple Yarn',
      category: 0,
      description: '.8 gauge purple yarn, 1 bundle',
      available: 1,
      amount: 1,
      status: 0
    )

    pencils = susan.items.create!(
      name: 'Dixon Ticonderoga',
      category: 6,
      description: 'The best pencil known to humankind',
      available: 1,
      amount: 1,
      status: 0
    )

    paper = joseph.items.create!(
      name: 'Multicolored Construction Paper',
      category: 1,
      description: 'THICC paper',
      available: 1,
      amount: 5,
      status: 0
    )

    query =
      <<~GQL
        query {
          getUserItems(id: #{susan.id}) {
            id
            name
            description
            available
            category
            status
          }
        }
      GQL

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:getUserItems]

    expect(data).to be_a(Array)
    expect(data.count).to eq(2)
    expect(data[0][:name]).to eq('Purple Yarn')
    expect(data[1][:name]).to eq('Dixon Ticonderoga')
    expect(data[0][:name]).to_not eq('Multicolored Construction Paper')
  end
end
