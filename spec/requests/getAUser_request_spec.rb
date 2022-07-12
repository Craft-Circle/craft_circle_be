require 'rails_helper'

RSpec.describe 'getAUser', type: :request do
  it 'returns a user based on id' do
    @bojack = User.create!(name: 'Bojack Horseman', email: 'bjackhman@email.com')
    def query(id:)
      <<~GQL
        query {
          getAUser(
            id: #{@bojack.id}
          ) {
            id
            name
            email
          }
        }
      GQL
    end
    post '/graphql', params: { query: query(id: @bojack.id) }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:getAUser]

    expect(data[:name]).to eq @bojack.name
    expect(data[:email]).to eq @bojack.email
  end
end
