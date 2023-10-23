# frozen_string_literal: true

# The EmployeesHelper module includes various utility methods and helpers
# specifically related to employees in the application.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
