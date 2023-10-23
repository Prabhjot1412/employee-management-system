# frozen_string_literal: true

# This migration adds a "role" field to the "users" table in the database.
class AddRollFieldToUserTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :Role, :integer, default: 0
  end
end
