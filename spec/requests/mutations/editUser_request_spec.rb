require 'rails_helper'

RSpec.describe 'editUser', type: :request do
  it "edits a user" do
    User.create!(
      id: 1,
      name: "User 1",
      email: "one@email.com"
    )

    test_user = User.last

    expect(test_user).to be_a(User)
    expect(test_user.name).to eq("User 1")

    editer_mutation =
      <<~GQL
        mutation createUser {
            editUser(input:{id: #{test_user.id}, name: "Edited user name"}) {
              user {
                name
                email
              }
            }
          }
      GQL

    post '/graphql', params: { query: editer_mutation }
    json = JSON.parse(response.body, symbolize_names: true)

    edited_user = User.find(test_user.id)

    expect(json[:data][:editUser][:user][:name]).to eq("Edited user name")
    expect(json[:data][:editUser][:user][:email]).to eq("one@email.com")

    expect(edited_user.id).to eq(test_user.id)
    expect(edited_user.name).to eq("Edited user name")
    expect(edited_user.email).to eq("one@email.com")
  end

  it "returns an error when the user cannot be found" do
    editer_mutation =
    <<~GQL
      mutation createUser {
          editUser(input:{id: 0, name: "Edited user name"}) {
            user {
              name
              email
            }
          }
        }
    GQL

    post '/graphql', params: { query: editer_mutation }

    json = JSON.parse(response.body, symbolize_names: true)

    error = json[:errors][0]


    expect(error[:message]).to eq("User with ID 0 could not be found or doesn't exist")
  end
end
