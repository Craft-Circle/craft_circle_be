module Mutations
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    field :user, Types::UserType, null: false

    def resolve(**args)
      new_user = User.create!(args)
      { user: new_user }
    end
  end
end
