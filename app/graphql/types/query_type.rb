# module Types
#   class QueryType < Types::BaseObject
#     # Add root-level fields here.
#     # They will be entry points for queries on your schema.
#
#     field :fetch_notes, resolver: Queries::FetchNotes
#   end
# end

module Types
  class QueryType < Types::BaseObject

    field :get_users, [Types::UserType], null: false, description: "Returns a list of users"
    def get_users
      User.all
    end

    field :get_a_user, Types::UserType, null: false, description: "Returns a user" do
      argument :id, ID, required: true
    end
    def get_a_user(id:)
      User.find(id)
    end

    field :get_items, [Types::ItemType], null: false, description: "Returns all items"
    def get_items
      Item.all
    end

    field :get_user_items, [Types::ItemType], null: false, description: "Returns a users items" do
      argument :id, ID, required: true
    end
    def get_user_items(id:)
      @user = User.find(id)
      @user.items
    end

    field :item_search, [Types::ItemType], null: false, description: "Returns an array of items with a similar name" do
      argument :keyword, String, required: true
    end
    def item_search(keyword:)
      items = Item.where("name ILIKE ?", "%#{keyword}%")
    end
  end
end
