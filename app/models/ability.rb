# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :create,Employee, user: EMPLOYEE
    can :update, Employee, user: EMPLOYEE
    can :read, Employee if user.EMPLOYEE?
    can :manage, :all if user.admin? || user.ADMIN?
  end
end
