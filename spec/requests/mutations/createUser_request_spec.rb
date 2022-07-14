require 'rails_helper'

RSpec.describe 'createUser', type: :request do
  it "creates a user" do
    creater_mutation =
      <<~GQL
        mutation createUser {
            createUser(input:{name: "User one", email: "one@email.com"}) {
              user {
                name
                email
              }
            }
          }
      GQL
      post '/graphql', params: { query: creater_mutation }
      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:createUser][:user]
      expect(data[:name]).to eq("User one")
      expect(data[:email]).to eq("one@email.com")
      expect(User.last.name).to eq("User one")
  end
end
