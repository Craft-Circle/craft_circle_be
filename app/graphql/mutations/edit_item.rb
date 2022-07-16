module Mutations
  class EditItem < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :category, Integer, required: false
    argument :description, String, required: false
    argument :available, Boolean, required: false
    argument :amount, Integer, required: false
    argument :status, Integer, required: false
    argument :user_id, ID, required: false
    field :item, Types::ItemType, null: false

    def resolve(id:, **args)
      updated_item = Item.find(id)
      updated_item.update(args)
      if updated_item.save
        { item: updated_item }
      else
        raise GraphQL::ExecutionError,
              'Item update failed. Ensure desired fields are not blank and have correct data types.'
      end
    end
  end
end
