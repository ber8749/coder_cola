Product.create(name: 'Coder Cola Case', description: '24 cans of Coder Cola', price: 14.99)
user = User.create(first_name: 'Coder', last_name: 'Cola', role: 'admin', email: 'codercola@example.com', password: 'WXYz1234')
user.addresses.create(line1: '1 Fake St.', line2: 'Apt. Z', city: 'San Diego', state: 'California', postal_code: '92024', country: 'United States', kind: 'shipping')
