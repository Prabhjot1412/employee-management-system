# frozen_string_literal: true

# The ApplicationHelper module includes various utility methods and helpers
# that can be used throughout the application.
module ApplicationHelper
  def user_path(*_attri)
    employee_path
  end
end
