# Create demo user
User.create!(
  email: 'demo@example.com',
  name: 'J. Doe',
  password: 'password',
  password_confirmation: 'password'
)

# Clients and orders
clients = [
  {
    attributes: {
      title: 'Pied piper',
      name: 'Richard Hendrix',
      email: 'richard.hendrix@gmail.com',
      phone: Faker::PhoneNumber.cell_phone
    },
    orders: [
      {
        title: 'Chat app up design',
        status: :done,
        price: 2800,
        payed_amount: 2800,
        cost: 1000,
        invoice_number: 3,
        invoice_date: Time.zone.today - 35.days
      },
      {
        title: 'Landing page design',
        status: :pending,
        price: 2800,
        payed_amount: 0,
        cost: 1000,
        invoice_number: 5,
        invoice_date: Time.zone.today
      }
    ]
  },
  {
    attributes: {
      title: 'Hooli',
      name: 'Gavin Belson',
      email: 'g.belson@huli.com',
      phone: Faker::PhoneNumber.cell_phone
    },
    orders: [
      {
        title: 'Backend development',
        status: :in_progress,
        price: 9800,
        payed_amount: 9800,
        cost: 5000,
        invoice_number: 4,
        invoice_date: Time.zone.today - 14.days
      }
    ]
  },
  {
    attributes: {
      title: 'Raviga',
      name: 'Laurie Bream',
      email: 'laurie@raviga.com',
      phone: Faker::PhoneNumber.cell_phone
    },
    orders: [
      {
        title: 'Market research',
        status: :done,
        price: 10000,
        payed_amount: 10000,
        cost: 3000,
        invoice_number: 2,
        invoice_date: Time.zone.today - 50.days
      }
    ]
  },
  {
    attributes: {
      title: 'Aviato',
      name: 'Erlich Bachman',
      email: 'erlich@gmail.com',
      phone: Faker::PhoneNumber.cell_phone
    },
    orders: [
      {
        title: 'Logo design',
        status: :done,
        price: 1000,
        payed_amount: 1000,
        cost: 500,
        invoice_number: 1,
        invoice_date: Time.zone.today - 75.days
      }
    ]
  }
]

# Create clients and orders from hash
clients.each do |client_data|
  client = Client.create!(client_data[:attributes])

  client_data[:orders].each do |order_data|
    client.orders.create!(order_data)
  end
end

# Add more clients with random values
10.times do |i|
  Client.create(
    name:  Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    title: Faker::Company.name
  )
end
