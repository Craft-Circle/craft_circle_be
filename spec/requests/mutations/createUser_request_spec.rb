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

  it "fails gracefully when a a user with the entered email already exists" do
    user_1 = User.create!(
      name: "new user",
      email: "one@email.com"
    )
    error_mutation =
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
    post '/graphql', params: { query: error_mutation }
    json = JSON.parse(response.body, symbolize_names: true)
    error = json[:errors][0]

    expect(error[:message]).to eq("#{user_1.email} is already associated with another account. Your email must be unique.")
  end

  it "fails gracefully when a user does not enter an email or name" do
    error_mutation =
    <<~GQL
      mutation createUser {
          createUser(input:{name: "", email: ""}) {
            user {
              name
              email
            }
          }
        }
    GQL
    post '/graphql', params: { query: error_mutation }
    json = JSON.parse(response.body, symbolize_names: true)
    error = json[:errors][0]

    expect(error[:message]).to eq("Name and email must not be left blank.")
  end
end
