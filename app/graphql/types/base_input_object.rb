# frozen_string_literal: true

module Types
  # Types::BaseInputObject is a custom GraphQL input object type used in our schema.
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument
  end
end
