module Mutations
  class EditUser < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
    field :user, Types::UserType

    def resolve(id:, **args)
      updated_user = User.find(id)
      # updated_user.update!(args)
      # updated_user.save
      if updated_user.update(args)
      { user: updated_user }
      else
        raise GraphQL::ExecutionError,
              "#{args[:email]} is already associated with another account. Your email must be unique."
      end
    end
  end
end
