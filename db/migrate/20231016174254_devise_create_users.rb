# frozen_string_literal: true

# This migration creates the "users" table and adds the necessary columns for Devise authentication.
class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps null: false

      # custome
      t.string :name
      t.references :role
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
  # rubocop:enable Metrics/MethodLength
end
