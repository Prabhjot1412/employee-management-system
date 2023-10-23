# frozen_string_literal: true

module Types
  # Types::UserInputType is a custom GraphQL input object type used for user-related input data.
  class UserInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :email, String, required: false
    argument :password, String, required: false
    argument :encrypted_password, String, required: false
    argument :reset_password_token, String, required: false
    argument :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :remember_created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :name, String, required: false
    argument :role_id, Integer, required: false
  end
end
