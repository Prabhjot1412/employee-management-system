# frozen_string_literal: true

module Types
  # Types::BaseField is a custom GraphQL field type used in our schema.
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument
  end
end
