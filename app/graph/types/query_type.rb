QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  field :node, field: NodeIdentification.field

  field :user do
    type UserType
    argument :id, !types.String
    resolve -> (obj, args, ctx) { User.find(args["id"]) }
  end
end
