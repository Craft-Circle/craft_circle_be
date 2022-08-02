require 'rails_helper'

RSpec.describe 'createUser', type: :request do
  it 'creates a user' do
    creater_mutation =
      <<~GQL
        mutation createUser {
            createUser(input:{name: "User one", email: "one@email.com", password: "D", passwordConfirmation: "D"}) {
              user {
                name
                email
                passwordDigest
              }
            }
          }
      GQL
    post '/graphql', params: { query: creater_mutation }
    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:createUser][:user]
    expect(data[:name]).to eq('User one')
    expect(data[:email]).to eq('one@email.com')
    expect(User.last.name).to eq('User one')
    expect(User.last.password_digest.chars.count).to eq(60)
  end

  it 'errors on mismatched password/confirmation' do
    creater_mutation =
      <<~GQL
        mutation createUser {
            createUser(input:{name: "User one", email: "one@email.com", password: "we<3joe", passwordConfirmation: "we<3joseph"}) {
              user {
                name
                email
              }
            }
          }
      GQL
    expect { post '/graphql', params: { query: creater_mutation } }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
