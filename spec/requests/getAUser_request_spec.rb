require 'rails_helper'

RSpec.describe 'getAUser', type: :request do
  before do
    @bojack = User.create!(name: 'Bojack Horseman', email: 'bjackhman@email.com')
  end

  it 'returns a user based on id' do
    def query(email:)
      <<~GQL
        query {
          getAUser(
            email: "#{@bojack.email}"
          ) {
            id
            name
            email
          }
        }
      GQL
    end
    
    post '/graphql', params: { query: query(email: @bojack.email) }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:getAUser]

    expect(data[:name]).to eq @bojack.name
    expect(data[:email]).to eq @bojack.email
  end

  it "returns an error if not found" do
    def query(email:)
      <<~GQL
      query {
        getAUser(
          email: "#{email}"
          ) {
            id
            name
            email
          }
        }
        GQL
      end

    post '/graphql', params: { query: query(email: "ojac") }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:errors][0][:message]   

    expect(data).to eq("Cannot return null for non-nullable field Query.getAUser")
    expect(data).to_not eq(@bojack.name)
  end
end
