module Types
  class MutationType < Types::BaseObject
    # user mutations
    field :create_user, mutation: Mutations::CreateUser
    field :delete_user, mutation: Mutations::DeleteUser
    field :edit_user, mutation: Mutations::EditUser

    # item mutations
    field :create_item, mutation: Mutations::CreateItem
    field :edit_item, mutation: Mutations::EditItem
    # field :delete_item, mutation: Mutations::DeleteItem
  end
end
