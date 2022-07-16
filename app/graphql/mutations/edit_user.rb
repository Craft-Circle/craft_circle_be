module Mutations
  class EditUser < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: false
    field :user, Types::UserType
    field :error, String

    def resolve(id:, **args)
      updated_user = User.find(id)

      updated_user.update(args)
      if updated_user.save
        { user: updated_user }
      else
        raise GraphQL::ExecutionError.new("#{args[:email]} is already associated with another account. Your email must be unique.")
      end
    end
  end
end
