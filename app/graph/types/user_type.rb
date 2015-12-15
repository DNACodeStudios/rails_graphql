UserType = GraphQL::ObjectType.define do
  name "User"
  description "A User"
  interfaces [NodeIdentification.interface]

  global_id_field :id
  field :email, !types.String, "The users email address"
  field :token, !types.String, "The JWT token used for auth"
  field :todos, types[TodoType] do
    resolve -> (obj, args, ctx) {
      obj.todos
    }
  end
end
