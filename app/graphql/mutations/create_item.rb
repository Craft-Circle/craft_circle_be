module Mutations
  class CreateItem < BaseMutation
    argument :name, String, required: false
    argument :category, Integer, required: false
    argument :description, String, required: false
    argument :available, Integer, required: false
    argument :amount, Integer, required: false
    argument :status, Integer, required: false
    argument :user_id, ID, required: false
    field :item, Types::ItemType, null: false
    field :user, Types::UserType, null: false

    def resolve(**args)
      new_item = Item.create!(args)
      { item: new_item }
    end
  end
end
