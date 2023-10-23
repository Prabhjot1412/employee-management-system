# frozen_string_literal: true

# The Ability class defines user permissions and abilities in the application.
class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, User if user.employee?
    can :manage, :all if user.admin? || user.admin!
  end
end
