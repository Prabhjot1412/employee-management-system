# frozen_string_literal: true

# The Role class represents the roles and permissions assigned to users in the application.
class Role < ApplicationRecord
  ADMIN =    'Admin'
  EMPLOYEE = 'Employee'

  SUPPORTTED_ROLES = [
    ADMIN,
    EMPLOYEE
  ].freeze

  has_many :users, foreign_key: 'role_id'
end
