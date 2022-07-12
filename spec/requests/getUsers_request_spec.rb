require 'rails_helper'

RSpec.describe 'getUsers', type: :request do
  it 'returns all users instances' do
    @bojack = User.create!(name: 'Bojack Horseman', email: 'bjackhman@email.com')
    @pc = User.create!(name: 'Princess Caroline', email: 'pc@email.com')
    query =
      <<~GQL
        query {
          getUsers {
            id
            name
            email
          }
        }
      GQL

    post '/graphql', params: { query: query }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:getUsers]

    expect(data.count).to eq 2
    expect(data[0][:id]).to eq @bojack.id.to_s
    expect(data[1][:email]).to eq @pc.email
  end
end
