2.times do |i|
  User.seed(
    :id,
    { id: i, name: Faker::Name.name, email: Faker::Internet.email, password: 'password' },
  )
  

end

