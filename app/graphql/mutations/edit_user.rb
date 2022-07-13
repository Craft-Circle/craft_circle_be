module Mutations
  class EditUser < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: false
    field :user, Types::UserType, null: false

    def resolve(id:, **args)
      updated_user = User.find(id)
      updated_user.update(args)
      if updated_user.save
        { user: updated_user }
      end
    end
  end
end