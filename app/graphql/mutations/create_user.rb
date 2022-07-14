module Mutations 
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    field :user, Types::UserType, null: false

    def resolve(**args) 
      new_user = User.create!(args)
      # if new_user.save
        {user: new_user}
      # end
    end
  end

end