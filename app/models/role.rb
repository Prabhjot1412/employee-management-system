class Role < ApplicationRecord
  ADMIN =    'Admin'
  EMPLOYEE = 'Employee'

  SUPPORTTED_ROLES = [
    ADMIN,
    EMPLOYEE
  ]

  has_many :users, foreign_key: 'role_id'

end
