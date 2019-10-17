# Create demo user
User.create!(
  email: 'demo@example.com',
  name: 'J. Doe',
  password: 'password',
  password_confirmation: 'password'
)

# Create clients, orders, and comments from hash
20.times do
  Client.create!(
    title: Faker::Company.unique.name,
    name:  Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.cell_phone_with_country_code
  )
end
