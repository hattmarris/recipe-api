# Defines User type
UserType = GraphQL::ObjectType.define do
  name "User"
  description "A user."
  # `!` marks a field as "non-null"
  field :id, !types.ID
  field :name, !types.String
end


# Defines an entry point to the system, the “query root”
QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :user do
    type UserType
    argument :id, !types.ID
    description "Find a User by ID"
    resolve ->(obj, args, ctx) { User.find(args["id"]) }
  end
end

# Then, build a schema with QueryType as the query entry point
Schema = GraphQL::Schema.define do
  query QueryType
end

# Example query string for user w id 86bb1bf0-9ff8-469a-bb5f-6981db09d7e0
# query_string = '
# {
#   user(id: "86bb1bf0-9ff8-469a-bb5f-6981db09d7e0") {
#     id
#     name
#   }
# }'
#
# Run with
# result_hash = Schema.execute(query_string)
