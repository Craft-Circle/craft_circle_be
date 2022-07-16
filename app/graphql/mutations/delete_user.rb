module Mutations
  class DeleteUser < BaseMutation
    argument :id, ID, required: true
    field :success, Boolean

    def resolve(id:)
      user = User.find(id)
      if user.destroy
        {success: true}
      else
        {success: false}
      end
    end
  end
end
