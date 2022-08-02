require 'rails_helper'

RSpec.describe 'getAUser', type: :request do
  before do
    @bojack = User.create!(name: 'Bojack Horseman', email: 'bjackhman@email.com', password: 'bjackhman',
                           password_confirmation: 'bjackhman')
  end

  it 'returns a user based on email and password' do
    def query(email:, password:)
      <<~GQL
        query {
          loginAUser(
            email: "#{@bojack.email}",
            password: "bjackhman"
          ) {
            id
            name
            email
          }
        }
      GQL
    end

    post '/graphql', params: { query: query(email: @bojack.email, password: 'bjackhman') }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:loginAUser]
    expect(data[:name]).to eq @bojack.name
    expect(data[:email]).to eq @bojack.email
  end

  it 'returns an error if incorrect password' do
    def query(email:, password:)
      <<~GQL
        query {
          loginAUser(
            email: "#{@bojack.email}",
            password: "incorrect"
          ) {
            id
            name
            email
          }
        }
      GQL
    end

    post '/graphql', params: { query: query(email: @bojack.email, password: 'incorrect') }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:errors][0][:message]

    expect(data).to eq('Email or password incorrect')
    expect(data).to_not eq(@bojack.name)
  end
end
