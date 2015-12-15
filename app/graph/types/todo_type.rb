TodoType = GraphQL::ObjectType.define do
  name "Todo"
  description "A Todo"
  interfaces [NodeIdentification.interface]

  global_id_field :id
  field :description, !types.String, "The todo description"
  field :completed, !types.Boolean, "Is the todo complete?"
end
