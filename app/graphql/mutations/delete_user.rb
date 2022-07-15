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

    rescue ActiveRecord::RecordNotFound => error
      GraphQL::ExecutionError.new("User with ID #{id} could not be found or doesn't exist")
    end
  end
end
