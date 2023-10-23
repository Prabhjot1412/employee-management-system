# frozen_string_literal: true

# This migration removes the "role" field from the "users" table in the database.
class RemoveRoleFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role
  end
end
