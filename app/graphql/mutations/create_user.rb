module Mutations
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    field :user, Types::UserType, null: false

    def resolve(**args)
      if args[:name].empty? || args[:email].empty?
        raise GraphQL::ExecutionError.new("Name and email must not be left blank.")
      end
      new_user = User.create!(args)
      {user: new_user}

    rescue ActiveRecord::RecordInvalid => error
      GraphQL::ExecutionError.new("#{args[:email]} is already associated with another account. Your email must be unique.")
    end
  end

end
