# frozen_string_literal: true

module Types
  # Types::BaseUnion is a custom GraphQL union type used in our schema.
  class BaseUnion < GraphQL::Schema::Union
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
  end
end
