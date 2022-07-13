module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    # # TODO: remove me
    # field :user_field, Object, null: false,
    #   description: "All users"
    # def user_field
    #   User.all
    # end
  end
end
