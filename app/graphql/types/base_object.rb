# frozen_string_literal: true

module Types
  # Types::BaseObject is a custom GraphQL object type used in our schema.
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField
  end
end
