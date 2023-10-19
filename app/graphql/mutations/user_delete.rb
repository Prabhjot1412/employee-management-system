# frozen_string_literal: true

module Mutations
  class UserDelete < BaseMutation
    description "Deletes a user by ID"


    argument :id, ID, required: true

    type Types::UserType

    def resolve(id:)
      user = ::User.find(id)
      raise GraphQL::ExecutionError.new "Error deleting user", extensions: user.errors.to_hash unless user.destroy

      { user: user }
    end
  end
end

# sample
# mutation {
#   userDelete(input: { id: 1}) {
#     name
#   }
# }
