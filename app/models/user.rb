# frozen_string_literal: true

# The User class represents individual users in the application.
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  before_validation :set_default_role
  scope :employees, -> { where(role_id: Role.find_by_name(Role::EMPLOYEE).id) }

  def set_default_role
    self.role = Role.find_by_name(Role::EMPLOYEE)
  end

  # enum Role: %i[admin employee]
  # after_initialize :set_default_role, if: :new_record?
  # # set default role to user  if not set
  # def set_default_role
  #   self.Role ||= :employee
  # end
end
