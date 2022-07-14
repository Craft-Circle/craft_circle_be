module Mutations
  class DeleteItem < BaseMutation
    argument :id, ID, required: true
    field :success, Boolean

    def resolve(id:)
      item = Item.find(id)
      if item.destroy
        { success: true }
      else
        { success: false }
      end
    end
  end
end
