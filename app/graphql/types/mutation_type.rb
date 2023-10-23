# frozen_string_literal: true

module Types
  # Types::MutationType is a GraphQL object type that serves as the root for mutation operations.
  class MutationType < Types::BaseObject
    field :user_update, mutation: Mutations::UserUpdate
    field :user_delete, mutation: Mutations::UserDelete
    field :user_create, mutation: Mutations::UserCreate
    # TODO: remove me
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end
  end
end
