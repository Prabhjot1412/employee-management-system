# frozen_string_literal: true

module Mutations
  class UserCreate < BaseMutation
    description "Creates a new user"

    field :user, Types::UserType, null: false

    argument :user_input, Types::UserInputType, required: true

    def resolve(user_input:)
      user = ::User.new(**user_input)
      raise GraphQL::ExecutionError.new "Error creating user", extensions: user.errors.to_hash unless user.save

      { user: user }
    end
  end
end

# sample mutation
# mutation {
#   userCreate(input: {
#     userInput: {
#       name: "qwe",
#       password: "Fake_password123",
#       email: "myEmail@email.com",
#       roleId: 1,
#     }
#   }) {
#     clientMutationId
#   }
# }
