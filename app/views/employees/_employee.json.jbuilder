# frozen_string_literal: true

json.extract! employee, :id, :name, :email, :department, :created_at, :updated_at
json.url employee_url(employee, format: :json)
