# frozen_string_literal: true

puts 'Createing roles.....'

Role::SUPPORTTED_ROLES.each do |role|
  Role.create!(name: role)
end

puts 'Createing admin.....'
User.create!(
  name: 'Admin',
  role_id: Role.find_by_name(Role::ADMIN).id,
  email: Faker::Internet.email,
  password: 'Fake_passwor123'
)
