require 'rails_helper'

RSpec.describe 'deleteUser', type: :request do
  it "creates a user" do
    test_user = User.create!(
      id: 1,
      name: "User 1",
      email: "one@email.com"
    )

    expect(test_user).to be_a(User)
    expect(test_user.name).to eq("User 1")
    expect(User.all).to include(test_user)

    deleter_mutation =
      <<~GQL
        mutation deleteUser {
            deleteUser(input:{id: #{test_user.id}}) {
              success
            }
          }
      GQL
    post '/graphql', params: { query: deleter_mutation }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:deleteUser][:success]).to be true
    expect(User.all.empty?).to be true
  end

  it "fails gracefully when a user cannot be found" do
    error_mutation =
      <<~GQL
        mutation deleteUser {
            deleteUser(input:{id: 0}) {
              success
            }
          }
      GQL
    post '/graphql', params: { query: error_mutation }
    json = JSON.parse(response.body, symbolize_names: true)
    error = json[:errors][0]
    expect(error[:message]).to eq("User with ID 0 could not be found or doesn't exist")
  end

end
