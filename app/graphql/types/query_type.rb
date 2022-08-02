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
    field :get_users, [Types::UserType], null: false, description: 'Returns a list of users'
    def get_users
      User.all
    end

    field :get_a_user, Types::UserType, null: false, description: 'Returns a user' do
      argument :email, String, required: true
    end
    def get_a_user(email:)
      User.where(email: "#{email}").first
    end

    field :login_a_user, Types::UserType, null: false, description: 'Returns a user' do
      argument :email, String, required: true
      argument :password, String, required: true
    end
    def login_a_user(email:, password:)
      user = User.where(email: "#{email}").first
      if user.authenticate(password)
        user
      else
        raise GraphQL::ExecutionError,
              "Email or password incorrect"
      end
    end

    field :get_items, [Types::ItemType], null: false, description: 'Returns all items'
    def get_items
      Item.all
    end

    field :get_user_items, [Types::ItemType], null: false, description: 'Returns a users items' do
      argument :id, ID, required: true
    end
    def get_user_items(id:)
      @user = User.find(id)
      @user.items
    end

    field :item_search, [Types::ItemType], null: false, description: 'Returns an array of items with a similar name' do
      argument :keyword, String, required: true
    end
    def item_search(keyword:)
      items = Item.where('name ILIKE ?', "%#{keyword}%")
    end

    field :filter_by_category, [Types::ItemType], null: false,
                                                  description: 'Returns an array of items with same category' do
      argument :keyword, String, required: true
    end
    def filter_by_category(keyword:)
      items = Item.where(category: keyword)
    end
  end
end
